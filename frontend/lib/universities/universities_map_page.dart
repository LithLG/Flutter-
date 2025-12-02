// universities/universities_map_page.dart
import 'dart:convert';
import 'dart:ui'; // Necessário para Web/Desktop scroll
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import '../theme/app_colors.dart';

// --- HABILITA ARRASTAR COM MOUSE NO DESKTOP ---
class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class UniversityModel {
  final String id;
  final String name;
  final String address;
  final LatLng location;
  final double distance;
  late final String acronym;
  late final String? uf;

  UniversityModel({
    required this.id,
    required this.name,
    required this.address,
    required this.location,
    required this.distance,
  }) {
    acronym = _generateAcronym(name);
    uf = _extractUF(address);
  }

  String _generateAcronym(String fullName) {
    if (fullName.toLowerCase().contains("são paulo")) return "USP";
    if (fullName.toLowerCase().contains("campinas")) return "UNICAMP";
    final words = fullName.split(' ')
        .where((w) => w.length > 2 && !['das', 'dos', 'de', 'do', 'da', 'e'].contains(w.toLowerCase()))
        .take(3);
    if (words.isEmpty) return fullName.substring(0, 2).toUpperCase();
    String generated = words.map((w) => w[0].toUpperCase()).join();
    return generated.length > 1 ? generated : fullName.substring(0, 3).toUpperCase();
  }

  String? _extractUF(String address) {
    final regex = RegExp(r'-\s?([A-Z]{2})\b');
    final match = regex.firstMatch(address);
    return match?.group(1);
  }
}

class UniversitiesMapPage extends StatefulWidget {
  final bool isDarkMode;
  const UniversitiesMapPage({Key? key, required this.isDarkMode}) : super(key: key);

  @override
  _UniversitiesMapPageState createState() => _UniversitiesMapPageState();
}

class _UniversitiesMapPageState extends State<UniversitiesMapPage> {
  GoogleMapController? _mapController;
  final PageController _pageController = PageController(viewportFraction: 0.85);
  
  List<UniversityModel> _universities = [];
  Set<Marker> _markers = {};
  
  bool _isLoading = true;
  LatLng? _selectedLocation;
  
  // Começa em 5km
  double _searchRadius = 5000; 

  final String _apiKey = 'AIzaSyCPgWNk0mtakAHXX5DNvYDlscAaSq8u3p8'; 

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  void dispose() {
    // ⚠️ Correção do Travamento: 
    // No Web/Mapas, as vezes chamar dispose manual do controller causa conflito.
    // O plugin gerencia isso, então apenas limpamos as variáveis locais.
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _getCurrentLocation() async {
    setState(() => _isLoading = true);
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) throw 'Ative o GPS.';

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) throw 'Sem permissão de GPS.';
      }
      
      Position position = await Geolocator.getCurrentPosition();
      
      if (!mounted) return;
      setState(() {
        _selectedLocation = LatLng(position.latitude, position.longitude);
      });
      _searchRealUniversities();

    } catch (e) {
      if (!mounted) return;
      setState(() {
        _selectedLocation = const LatLng(-23.5505, -46.6333);
        _isLoading = false;
      });
    }
  }

  Future<void> _searchRealUniversities() async {
    if (_selectedLocation == null || !mounted) return;

    setState(() {
      _isLoading = true;
      _markers.clear();
    });

    const String proxyUrl = 'https://cors-anywhere.herokuapp.com/'; 
    
    final String url = 
      proxyUrl + 
      'https://maps.googleapis.com/maps/api/place/nearbysearch/json?'
      'location=${_selectedLocation!.latitude},${_selectedLocation!.longitude}'
      '&radius=${_searchRadius.toInt()}' 
      '&type=university'
      '&keyword=faculdade'
      '&language=pt-BR'
      '&key=$_apiKey';

    try {
      final response = await http.get(Uri.parse(url));

      if (!mounted) return;

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'OK') {
          final results = data['results'] as List;
          final List<UniversityModel> parsedList = [];

          for (var place in results) {
            final geo = place['geometry']['location'];
            final lat = geo['lat'] as double;
            final lng = geo['lng'] as double;
            
            final dist = Geolocator.distanceBetween(
              _selectedLocation!.latitude, _selectedLocation!.longitude, 
              lat, lng
            );

            parsedList.add(UniversityModel(
              id: place['place_id'],
              name: place['name'],
              address: place['vicinity'] ?? '',
              location: LatLng(lat, lng),
              distance: dist,
            ));
          }

          parsedList.sort((a, b) => a.distance.compareTo(b.distance));

          setState(() {
            _universities = parsedList;
            _generateMarkers();
            _isLoading = false;
          });
          
          if (_universities.isNotEmpty) {
            _moveCamera(_universities.first.location); 
          }
        } else {
           setState(() => _isLoading = false);
           if (data['status'] == 'ZERO_RESULTS') {
             _showError('Nenhuma faculdade encontrada neste raio.');
           }
        }
      } else {
        setState(() => _isLoading = false);
      }
    } catch (e) {
      if(mounted) setState(() => _isLoading = false);
    }
  }

  void _generateMarkers() {
    Set<Marker> newMarkers = {};
    newMarkers.add(
      Marker(
        markerId: const MarkerId('user_loc'),
        position: _selectedLocation!,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        zIndex: 2,
      ),
    );

    for (var uni in _universities) {
      newMarkers.add(
        Marker(
          markerId: MarkerId(uni.id),
          position: uni.location,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          infoWindow: InfoWindow(title: uni.name),
          onTap: () {
            final index = _universities.indexOf(uni);
            if (index != -1) {
              _pageController.animateToPage(
                index, 
                duration: const Duration(milliseconds: 300), 
                curve: Curves.easeInOut
              );
            }
          },
        ),
      );
    }
    setState(() => _markers = newMarkers);
  }

  void _moveCamera(LatLng target) {
    _mapController?.animateCamera(CameraUpdate.newLatLngZoom(target, 13));
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    final isDark = widget.isDarkMode;
    final cardColor = isDark ? const Color(0xFF2C2C2C) : Colors.white;
    final textColor = isDark ? Colors.white : Colors.black87;
    
    // Pega a largura da tela para decidir layout
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.topCenter, // Importante para o alinhamento responsivo
        children: [
          // 1. O MAPA (Camada base)
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _selectedLocation ?? const LatLng(-23.5505, -46.6333),
              zoom: 12,
            ),
            markers: _markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
            onMapCreated: (c) => _mapController = c,
            onTap: (loc) {
              setState(() => _selectedLocation = loc);
              _searchRealUniversities();
            },
          ),

          // 2. PAINEL SUPERIOR (SLIDER RESPONSIVO)
          // Usamos SafeArea para não colar na status bar do mobile
          Positioned(
            top: 10, // Pequena margem do topo
            child: SafeArea(
              child: GestureDetector(
                onTap: () {}, // Bloqueia clique no mapa
                child: Container(
                  // 🔥 LÓGICA RESPONSIVA AQUI:
                  // Se for Desktop (>600), usa 600px.
                  // Se for Mobile, usa 95% da tela.
                  constraints: const BoxConstraints(maxWidth: 600),
                  width: screenWidth > 600 ? 600 : screenWidth * 0.95,
                  
                  margin: const EdgeInsets.only(top: 50), // Espaço p/ botão voltar
                  child: Card(
                    color: cardColor,
                    elevation: 8,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Raio de busca",
                                style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${(_searchRadius / 1000).toInt()} km",
                                style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: AppColors.primary,
                              thumbColor: AppColors.primary,
                              overlayColor: AppColors.primary.withOpacity(0.2),
                              trackHeight: 4.0,
                            ),
                            child: Slider(
                              value: _searchRadius,
                              min: 5000,
                              max: 50000,
                              divisions: 9, 
                              label: "${(_searchRadius / 1000).toInt()} km",
                              onChanged: (val) {
                                setState(() => _searchRadius = val);
                              },
                              onChangeEnd: (val) {
                                _searchRealUniversities();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // 3. BOTÃO LOCALIZAÇÃO
          Positioned(
            right: 20,
            bottom: _universities.isNotEmpty ? 180 : 30,
            child: FloatingActionButton(
              heroTag: 'my_loc',
              onPressed: _getCurrentLocation,
              backgroundColor: AppColors.primary,
              child: const Icon(Icons.my_location, color: Colors.white),
            ),
          ),
          
          // 4. CARDS INFERIORES
          if (!_isLoading && _universities.isNotEmpty)
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              height: 150,
              child: ScrollConfiguration(
                behavior: AppScrollBehavior(),
                child: PageView.builder(
                  controller: _pageController,
                  physics: const BouncingScrollPhysics(),
                  itemCount: _universities.length,
                  onPageChanged: (index) {
                    _moveCamera(_universities[index].location);
                  },
                  itemBuilder: (context, index) {
                    return _buildUniversityCard(_universities[index], cardColor, textColor);
                  },
                ),
              ),
            ),

          if (_isLoading)
            Container(
              color: Colors.black45,
              child: const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            ),

          // 5. BOTÃO VOLTAR (🔥 CAMADA SUPERIOR)
          // Colocado por último na Stack para ter o Z-Index mais alto
          Positioned(
            top: 10,
            left: 20,
            child: SafeArea(
              child: CircleAvatar(
                 backgroundColor: cardColor,
                 radius: 22,
                 child: IconButton(
                   icon: Icon(Icons.arrow_back, color: textColor),
                   onPressed: () {
                     // Garante que sai da tela sem travar
                     Navigator.of(context).pop();
                   },
                   tooltip: 'Voltar',
                 ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUniversityCard(UniversityModel uni, Color bgColor, Color txtColor) {
    return Card(
      color: bgColor,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () => _moveCamera(uni.location),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                width: 50, height: 50,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    uni.acronym,
                    style: const TextStyle(
                      color: AppColors.primary, 
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      uni.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold, 
                        fontSize: 14,
                        color: txtColor
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      uni.address,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: txtColor.withOpacity(0.7)),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.directions_walk, size: 14, color: Colors.green),
                        const SizedBox(width: 4),
                        Text(
                          '${(uni.distance / 1000).toStringAsFixed(1)} km',
                          style: const TextStyle(fontSize: 12, color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}