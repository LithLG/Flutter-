import '../models/course.dart';

class CourseService {
  static final List<Course> _courses = [
    // TECNOLOGIA (cursos existentes)
    Course(
      id: '1',
      title: 'Engenharia de Software',
      description: 'O curso de Engenharia de Software forma profissionais capazes de projetar, desenvolver e gerenciar sistemas de software complexos, aplicando princípios de engenharia e boas práticas de desenvolvimento.',
      areas: [
        'Desenvolvimento de Sistemas',
        'Arquitetura de Software',
        'Gestão de Projetos de TI',
        'Qualidade de Software',
        'Inteligência Artificial',
        'Segurança da Informação',
        'Desenvolvimento Mobile'
      ],
      minSalary: 3500,
      maxSalary: 20000,
      competencies: [
        'Programação em múltiplas linguagens',
        'Gestão de projetos ágeis',
        'Arquitetura de sistemas escaláveis',
        'Testes e qualidade de software',
        'Banco de dados e modelagem',
        'DevOps e infraestrutura',
        'Resolução de problemas complexos'
      ],
      category: 'Tecnologia',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade de São Paulo',
      rating: 4.8,
      reviews: 324,
    ),
    Course(
      id: '2',
      title: 'Análise e Desenvolvimento de Sistemas',
      description: 'Curso de tecnologia focado no desenvolvimento de sistemas computacionais, com ênfase em programação, banco de dados e engenharia de software.',
      areas: [
        'Desenvolvimento Web',
        'Desenvolvimento Mobile',
        'Banco de Dados',
        'Redes de Computadores',
        'Suporte Técnico',
        'Gestão de Projetos'
      ],
      minSalary: 2800,
      maxSalary: 12000,
      competencies: [
        'Lógica de programação',
        'Desenvolvimento front-end e back-end',
        'Gestão de banco de dados',
        'Testes de software',
        'Documentação de sistemas'
      ],
      category: 'Tecnologia',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Fatec',
      rating: 4.5,
      reviews: 215,
    ),

    // SAÚDE (cursos existentes)
    Course(
      id: '3',
      title: 'Medicina',
      description: 'O curso de Medicina forma profissionais para atuar na promoção, prevenção, diagnóstico e tratamento de doenças, com base em princípios éticos e científicos.',
      areas: [
        'Clínica Médica',
        'Cirurgia Geral',
        'Pediatria',
        'Ginecologia e Obstetrícia',
        'Cardiologia',
        'Ortopedia',
        'Dermatologia'
      ],
      minSalary: 6000,
      maxSalary: 35000,
      competencies: [
        'Diagnóstico clínico',
        'Procedimentos médicos',
        'Relação médico-paciente',
        'Tomada de decisão em emergências',
        'Interpretação de exames',
        'Prescrição de tratamentos',
        'Gestão em saúde'
      ],
      category: 'Saúde',
      duration: 12,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal do Rio de Janeiro',
      rating: 4.9,
      reviews: 189,
    ),
    Course(
      id: '4',
      title: 'Enfermagem',
      description: 'Formação voltada para o cuidado integral à saúde, com enfoque na assistência, gestão e educação em saúde.',
      areas: [
        'Enfermagem Geral',
        'Enfermagem Intensiva',
        'Enfermagem Obstétrica',
        'Enfermagem Pediátrica',
        'Enfermagem em Saúde Coletiva',
        'Gestão em Enfermagem'
      ],
      minSalary: 2200,
      maxSalary: 9000,
      competencies: [
        'Assistência integral ao paciente',
        'Administração de medicamentos',
        'Curativos e procedimentos',
        'Educação em saúde',
        'Gestão de serviços de enfermagem'
      ],
      category: 'Saúde',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Estadual de Campinas',
      rating: 4.6,
      reviews: 167,
    ),

    // ENGENHARIA (cursos existentes)
    Course(
      id: '5',
      title: 'Engenharia Civil',
      description: 'O curso de Engenharia Civil forma profissionais para projetar, gerenciar e executar obras de infraestrutura, considerando aspectos técnicos, econômicos e ambientais.',
      areas: [
        'Estruturas e Fundações',
        'Gestão de Obras',
        'Saneamento Básico',
        'Transportes e Vias',
        'Recursos Hídricos',
        'Patologia das Construções',
        'Orçamento e Licitações'
      ],
      minSalary: 4000,
      maxSalary: 18000,
      competencies: [
        'Cálculo estrutural',
        'Gestão de projetos',
        'Planejamento de obras',
        'Orçamentação',
        'Desenho técnico',
        'Gestão de equipes',
        'Sustentabilidade'
      ],
      category: 'Engenharia',
      duration: 10,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal de Minas Gerais',
      rating: 4.7,
      reviews: 278,
    ),

    // GESTÃO E NEGÓCIOS (cursos existentes)
    Course(
      id: '6',
      title: 'Administração',
      description: 'O curso de Administração proporciona uma formação integrada que combina fundamentos teóricos e práticas essenciais da área.',
      areas: [
        'Gestão de empresas e organizações',
        'Recursos Humanos',
        'Marketing e Vendas',
        'Finanças e Controladoria',
        'Empreendedorismo e Inovação',
        'Consultoria Empresarial',
        'Logística e Operações'
      ],
      minSalary: 2500,
      maxSalary: 15000,
      competencies: [
        'Liderança e gestão de equipes',
        'Planejamento estratégico',
        'Análise de mercado e concorrência',
        'Gestão financeira e orçamentária',
        'Tomada de decisão em cenários complexos',
        'Comunicação e negociação',
        'Inovação e adaptação a mudanças'
      ],
      category: 'Gestão e Negócios',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Fundação Getúlio Vargas',
      rating: 4.6,
      reviews: 412,
    ),

    // DIREITO (cursos existentes)
    Course(
      id: '7',
      title: 'Direito',
      description: 'O curso de Direito forma profissionais para atuar na aplicação e interpretação das normas jurídicas, com ênfase na defesa dos direitos e na promoção da justiça.',
      areas: [
        'Advocacia Privada',
        'Carreira Jurídica Pública',
        'Consultoria Jurídica',
        'Diplomacia',
        'Ensino e Pesquisa',
        'Mediação e Arbitragem',
        'Compliance e Governança'
      ],
      minSalary: 3000,
      maxSalary: 25000,
      competencies: [
        'Interpretação de leis e normas',
        'Elaboração de peças processuais',
        'Negociação e mediação',
        'Pesquisa jurídica',
        'Argumentação e oratória',
        'Pensamento crítico',
        'Ética profissional'
      ],
      category: 'Direito',
      duration: 10,
      degreeType: 'Bacharelado',
      university: 'Universidade de São Paulo',
      rating: 4.7,
      reviews: 356,
    ),

    // EDUCAÇÃO (cursos existentes)
    Course(
      id: '8',
      title: 'Pedagogia',
      description: 'Formação de educadores para atuar na Educação Básica, com foco nos processos de ensino e aprendizagem.',
      areas: [
        'Docência na Educação Infantil',
        'Docência nos Anos Iniciais',
        'Gestão Escolar',
        'Coordenação Pedagógica',
        'Educação Inclusiva',
        'Educação de Jovens e Adultos'
      ],
      minSalary: 1800,
      maxSalary: 7000,
      competencies: [
        'Planejamento de aulas',
        'Avaliação da aprendizagem',
        'Gestão de sala de aula',
        'Educação inclusiva',
        'Metodologias de ensino',
        'Gestão de projetos educacionais'
      ],
      category: 'Educação',
      duration: 8,
      degreeType: 'Licenciatura',
      university: 'Universidade Estadual Paulista',
      rating: 4.4,
      reviews: 198,
    ),

    // COMUNICAÇÃO (cursos existentes)
    Course(
      id: '9',
      title: 'Jornalismo',
      description: 'Formação de profissionais para atuar na produção, edição e divulgação de informações em diferentes mídias.',
      areas: [
        'Jornalismo Impresso',
        'Jornalismo Digital',
        'Jornalismo Televisivo',
        'Jornalismo Radiofônico',
        'Assessoria de Imprensa',
        'Produção de Conteúdo',
        'Editoração'
      ],
      minSalary: 2000,
      maxSalary: 10000,
      competencies: [
        'Redação jornalística',
        'Apuração de fatos',
        'Edição de textos',
        'Produção audiovisual',
        'Gestão de mídias sociais',
        'Ética jornalística'
      ],
      category: 'Comunicação',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Pontifícia Universidade Católica',
      rating: 4.5,
      reviews: 156,
    ),

    // PSICOLOGIA (cursos existentes)
    Course(
      id: '10',
      title: 'Psicologia',
      description: 'O curso de Psicologia forma profissionais para compreender e intervir nos processos psicológicos humanos, promovendo saúde mental e qualidade de vida.',
      areas: [
        'Psicologia Clínica',
        'Psicologia Organizacional',
        'Psicologia Escolar',
        'Psicologia Social',
        'Psicologia Hospitalar',
        'Neuropsicologia',
        'Psicologia do Esporte'
      ],
      minSalary: 2800,
      maxSalary: 12000,
      competencies: [
        'Avaliação psicológica',
        'Intervenção terapêutica',
        'Escuta ativa e empatia',
        'Análise do comportamento',
        'Pesquisa em psicologia',
        'Orientação profissional',
        'Desenvolvimento humano'
      ],
      category: 'Saúde',
      duration: 10,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal do Rio Grande do Sul',
      rating: 4.7,
      reviews: 223,
    ),

    // ==================================================
    // NOVOS CURSOS DE BACHARELADO ADICIONADOS
    // ==================================================

    // GESTÃO E NEGÓCIOS
    Course(
      id: '11',
      title: 'Administração Pública',
      description: 'Formação de gestores para atuar no setor público, com foco em políticas públicas, gestão governamental e administração de organizações estatais.',
      areas: [
        'Gestão Pública Municipal',
        'Gestão Pública Estadual',
        'Gestão Pública Federal',
        'Políticas Públicas',
        'Orçamento Público',
        'Licitações e Contratos',
        'Gestão de Projetos Sociais'
      ],
      minSalary: 3000,
      maxSalary: 15000,
      competencies: [
        'Gestão de recursos públicos',
        'Elaboração de políticas públicas',
        'Orçamentação pública',
        'Licitações e contratos administrativos',
        'Gestão de pessoas no setor público',
        'Transparência e controle social',
        'Planejamento governamental'
      ],
      category: 'Gestão e Negócios',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Fundação Getúlio Vargas',
      rating: 4.5,
      reviews: 145,
    ),

    Course(
      id: '12',
      title: 'Ciências Contábeis',
      description: 'Formação de profissionais para atuar na gestão financeira, contábil e tributária de organizações, com ênfase na análise e controle patrimonial.',
      areas: [
        'Contabilidade Geral',
        'Auditoria Contábil',
        'Controladoria',
        'Contabilidade Tributária',
        'Perícia Contábil',
        'Consultoria Empresarial',
        'Contabilidade Pública'
      ],
      minSalary: 2800,
      maxSalary: 18000,
      competencies: [
        'Análise de demonstrações contábeis',
        'Auditoria e perícia',
        'Planejamento tributário',
        'Controladoria e custos',
        'Normas internacionais de contabilidade',
        'Gestão financeira',
        'Compliance fiscal'
      ],
      category: 'Gestão e Negócios',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade de São Paulo',
      rating: 4.6,
      reviews: 278,
    ),

    Course(
      id: '13',
      title: 'Ciências Econômicas',
      description: 'Formação de economistas para analisar fenômenos econômicos, desenvolver políticas e atuar no mercado financeiro e em organizações públicas e privadas.',
      areas: [
        'Economia Empresarial',
        'Economia Pública',
        'Mercado Financeiro',
        'Economia Internacional',
        'Pesquisa Econômica',
        'Consultoria Econômica',
        'Desenvolvimento Econômico'
      ],
      minSalary: 3500,
      maxSalary: 20000,
      competencies: [
        'Análise de conjuntura econômica',
        'Econometria e modelagem',
        'Políticas econômicas',
        'Mercado financeiro e capitais',
        'Comércio internacional',
        'Desenvolvimento sustentável',
        'Gestão de riscos econômicos'
      ],
      category: 'Gestão e Negócios',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal do Rio de Janeiro',
      rating: 4.7,
      reviews: 189,
    ),

    Course(
      id: '14',
      title: 'Relações Internacionais',
      description: 'Formação de profissionais para atuar nas relações entre países, organizações internacionais e empresas multinacionais, com foco em diplomacia e comércio exterior.',
      areas: [
        'Diplomacia',
        'Comércio Exterior',
        'Organizações Internacionais',
        'Cooperação Internacional',
        'Inteligência de Mercado',
        'Gestão de Projetos Internacionais',
        'Análise Geopolítica'
      ],
      minSalary: 3200,
      maxSalary: 16000,
      competencies: [
        'Negociação internacional',
        'Análise geopolítica',
        'Comércio exterior e aduana',
        'Direito internacional',
        'Diplomacia e protocolo',
        'Idiomas estrangeiros',
        'Gestão de crises internacionais'
      ],
      category: 'Gestão e Negócios',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade de Brasília',
      rating: 4.6,
      reviews: 167,
    ),

    Course(
      id: '15',
      title: 'Marketing',
      description: 'Formação de profissionais para desenvolver estratégias de mercado, gestão de marcas e comunicação mercadológica, com foco no relacionamento com consumidores.',
      areas: [
        'Marketing Digital',
        'Gestão de Marcas',
        'Pesquisa de Mercado',
        'Vendas e Trade Marketing',
        'Comunicação Mercadológica',
        'Marketing Estratégico',
        'Comportamento do Consumidor'
      ],
      minSalary: 2500,
      maxSalary: 14000,
      competencies: [
        'Estratégias de marketing',
        'Gestão de marcas',
        'Pesquisa de mercado',
        'Marketing digital e mídias sociais',
        'Comportamento do consumidor',
        'Planejamento de campanhas',
        'Análise de resultados'
      ],
      category: 'Gestão e Negócios',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Pontifícia Universidade Católica',
      rating: 4.5,
      reviews: 234,
    ),

    // ENGENHARIAS
    Course(
      id: '16',
      title: 'Engenharia Elétrica',
      description: 'Formação de engenheiros para projetar, desenvolver e gerenciar sistemas elétricos, de energia e eletrônicos, com aplicações em diversos setores industriais.',
      areas: [
        'Sistemas de Potência',
        'Eletrônica',
        'Automação Industrial',
        'Energias Renováveis',
        'Instalações Elétricas',
        'Controle e Instrumentação',
        'Telecomunicações'
      ],
      minSalary: 4200,
      maxSalary: 22000,
      competencies: [
        'Projetos de sistemas elétricos',
        'Gestão de energia',
        'Automação e controle',
        'Eletrônica de potência',
        'Normas técnicas e segurança',
        'Manutenção de sistemas',
        'Sustentabilidade energética'
      ],
      category: 'Engenharia',
      duration: 10,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal de Minas Gerais',
      rating: 4.8,
      reviews: 312,
    ),

    Course(
      id: '17',
      title: 'Engenharia Mecânica',
      description: 'Formação de engenheiros para projetar, desenvolver e manter sistemas mecânicos, termodinâmicos e de fabricação, atuando em diversos segmentos industriais.',
      areas: [
        'Projetos Mecânicos',
        'Manutenção Industrial',
        'Termodinâmica',
        'Materiais e Processos',
        'Automação Industrial',
        'Gestão da Produção',
        'Pesquisa e Desenvolvimento'
      ],
      minSalary: 4000,
      maxSalary: 20000,
      competencies: [
        'Projetos mecânicos',
        'Gestão de manutenção',
        'Termodinâmica e fluidos',
        'Materiais e processos',
        'Automação industrial',
        'Gestão da produção',
        'Controle de qualidade'
      ],
      category: 'Engenharia',
      duration: 10,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal do Rio Grande do Sul',
      rating: 4.7,
      reviews: 278,
    ),

    Course(
      id: '18',
      title: 'Engenharia Química',
      description: 'Formação de engenheiros para atuar no desenvolvimento, projeto e operação de processos químicos industriais, com foco em transformação de materiais.',
      areas: [
        'Processos Químicos',
        'Controle de Qualidade',
        'Pesquisa e Desenvolvimento',
        'Gestão Ambiental',
        'Biocombustíveis',
        'Petróleo e Gás',
        'Indústria Farmacêutica'
      ],
      minSalary: 3800,
      maxSalary: 19000,
      competencies: [
        'Projetos de processos químicos',
        'Operações unitárias',
        'Controle de qualidade',
        'Gestão ambiental',
        'Termodinâmica aplicada',
        'Segurança de processos',
        'Otimização de produção'
      ],
      category: 'Engenharia',
      duration: 10,
      degreeType: 'Bacharelado',
      university: 'Universidade Estadual de Campinas',
      rating: 4.6,
      reviews: 245,
    ),

    Course(
      id: '19',
      title: 'Engenharia de Produção',
      description: 'Formação de engenheiros para otimizar sistemas produtivos, integrando recursos humanos, materiais e tecnológicos para aumentar a eficiência organizacional.',
      areas: [
        'Gestão da Produção',
        'Qualidade e Produtividade',
        'Logística e Cadeia de Suprimentos',
        'Gestão de Projetos',
        'Pesquisa Operacional',
        'Ergonomia e Segurança',
        'Engenharia Econômica'
      ],
      minSalary: 3500,
      maxSalary: 18000,
      competencies: [
        'Gestão de processos produtivos',
        'Controle de qualidade',
        'Logística e supply chain',
        'Gestão de projetos',
        'Pesquisa operacional',
        'Engenharia econômica',
        'Gestão da inovação'
      ],
      category: 'Engenharia',
      duration: 10,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal de Santa Catarina',
      rating: 4.7,
      reviews: 267,
    ),

    Course(
      id: '20',
      title: 'Engenharia Ambiental',
      description: 'Formação de engenheiros para desenvolver soluções sustentáveis, gerenciar recursos naturais e implementar tecnologias ambientais em diversos setores.',
      areas: [
        'Gestão Ambiental',
        'Recursos Hídricos',
        'Saneamento Ambiental',
        'Energias Renováveis',
        'Licenciamento Ambiental',
        'Resíduos Sólidos',
        'Recuperação de Áreas Degradadas'
      ],
      minSalary: 3200,
      maxSalary: 15000,
      competencies: [
        'Gestão de recursos hídricos',
        'Saneamento ambiental',
        'Licenciamento ambiental',
        'Gestão de resíduos',
        'Energias renováveis',
        'Auditoria ambiental',
        'Sustentabilidade'
      ],
      category: 'Engenharia',
      duration: 10,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal do Paraná',
      rating: 4.5,
      reviews: 189,
    ),

    // SAÚDE
    Course(
      id: '21',
      title: 'Farmácia',
      description: 'Formação de farmacêuticos para atuar no desenvolvimento, produção e controle de medicamentos, cosméticos e alimentos, além da atenção farmacêutica.',
      areas: [
        'Farmácia Hospitalar',
        'Indústria Farmacêutica',
        'Vigilância Sanitária',
        'Farmácia Clínica',
        'Análises Clínicas',
        'Cosmetologia',
        'Farmácia Comunitária'
      ],
      minSalary: 2800,
      maxSalary: 12000,
      competencies: [
        'Dispensação de medicamentos',
        'Controle de qualidade',
        'Análises clínicas',
        'Atenção farmacêutica',
        'Desenvolvimento de produtos',
        'Vigilância sanitária',
        'Gestão de farmácias'
      ],
      category: 'Saúde',
      duration: 10,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal de Santa Maria',
      rating: 4.6,
      reviews: 234,
    ),

    Course(
      id: '22',
      title: 'Nutrição',
      description: 'Formação de nutricionistas para atuar na promoção da saúde através da alimentação, desde a atenção clínica até a gestão de serviços de alimentação.',
      areas: [
        'Nutrição Clínica',
        'Nutrição Esportiva',
        'Saúde Coletiva',
        'Gestão de Unidades de Alimentação',
        'Docência e Pesquisa',
        'Indústria de Alimentos',
        'Consultoria Nutricional'
      ],
      minSalary: 2500,
      maxSalary: 10000,
      competencies: [
        'Avaliação nutricional',
        'Prescrição dietética',
        'Educação alimentar',
        'Gestão de UAN',
        'Nutrição esportiva',
        'Segurança alimentar',
        'Pesquisa em nutrição'
      ],
      category: 'Saúde',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal de Viçosa',
      rating: 4.5,
      reviews: 198,
    ),

    Course(
      id: '23',
      title: 'Fisioterapia',
      description: 'Formação de fisioterapeutas para atuar na prevenção, tratamento e reabilitação de distúrbios cinético-funcionais em diferentes contextos de saúde.',
      areas: [
        'Fisioterapia Ortopédica',
        'Fisioterapia Neurológica',
        'Fisioterapia Respiratória',
        'Fisioterapia Esportiva',
        'Fisioterapia do Trabalho',
        'Fisioterapia em UTI',
        'Saúde Coletiva'
      ],
      minSalary: 2600,
      maxSalary: 11000,
      competencies: [
        'Avaliação cinético-funcional',
        'Técnicas de reabilitação',
        'Prescrição de exercícios',
        'Fisioterapia preventiva',
        'Gestão em saúde',
        'Fisioterapia intensiva',
        'Pesquisa em fisioterapia'
      ],
      category: 'Saúde',
      duration: 10,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal de São Paulo',
      rating: 4.7,
      reviews: 267,
    ),

    Course(
      id: '24',
      title: 'Biomedicina',
      description: 'Formação de biomédicos para atuar em pesquisa, análises clínicas, diagnóstico por imagem e desenvolvimento de produtos biotecnológicos.',
      areas: [
        'Análises Clínicas',
        'Pesquisa Científica',
        'Biotecnologia',
        'Imagenologia',
        'Saúde Pública',
        'Indústria Farmacêutica',
        'Perícia Criminalística'
      ],
      minSalary: 2700,
      maxSalary: 13000,
      competencies: [
        'Análises laboratoriais',
        'Técnicas de biologia molecular',
        'Pesquisa científica',
        'Diagnóstico por imagem',
        'Biotecnologia',
        'Gestão laboratorial',
        'Bioética'
      ],
      category: 'Saúde',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal do Rio de Janeiro',
      rating: 4.6,
      reviews: 178,
    ),

    // CIÊNCIAS BIOLÓGICAS
    Course(
      id: '25',
      title: 'Biologia',
      description: 'Formação de biólogos para atuar em pesquisa, conservação ambiental, biotecnologia e educação, com compreensão dos seres vivos e ecossistemas.',
      areas: [
        'Pesquisa Científica',
        'Conservação Ambiental',
        'Biotecnologia',
        'Ensino Superior',
        'Consultoria Ambiental',
        'Bioinformática',
        'Controle de Qualidade'
      ],
      minSalary: 2200,
      maxSalary: 9000,
      competencies: [
        'Pesquisa científica',
        'Identificação de espécies',
        'Técnicas laboratoriais',
        'Gestão ambiental',
        'Biotecnologia',
        'Educação ambiental',
        'Bioestatística'
      ],
      category: 'Ciências Biológicas',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal do Rio Grande do Sul',
      rating: 4.4,
      reviews: 156,
    ),

    // CONTINUAÇÃO DOS OUTROS CURSOS...
    // Adicionando mais alguns cursos representativos

    Course(
      id: '26',
      title: 'Arquitetura e Urbanismo',
      description: 'Formação de arquitetos para projetar espaços construídos, planejar cidades e intervir no ambiente urbano com criatividade e responsabilidade social.',
      areas: [
        'Projetos Arquitetônicos',
        'Urbanismo',
        'Paisagismo',
        'Restauro e Patrimônio',
        'Design de Interiores',
        'Gestão de Obras',
        'Consultoria Técnica'
      ],
      minSalary: 3000,
      maxSalary: 16000,
      competencies: [
        'Projetos arquitetônicos',
        'Desenho técnico',
        'Conforto ambiental',
        'Gestão de projetos',
        'Urbanismo e planejamento',
        'Sustentabilidade',
        'História da arquitetura'
      ],
      category: 'Artes e Design',
      duration: 10,
      degreeType: 'Bacharelado',
      university: 'Universidade de São Paulo',
      rating: 4.7,
      reviews: 289,
    ),

    Course(
      id: '27',
      title: 'Design',
      description: 'Formação de designers para criar soluções inovadoras em produtos, serviços e comunicação visual, integrando estética, funcionalidade e usabilidade.',
      areas: [
        'Design de Produto',
        'Design Gráfico',
        'Design de Serviços',
        'Design de Experiência',
        'Design Estratégico',
        'Design Digital',
        'Design de Moda'
      ],
      minSalary: 2500,
      maxSalary: 12000,
      competencies: [
        'Projetos de design',
        'Desenho e representação',
        'Ergonomia e usabilidade',
        'Gestão de projetos criativos',
        'Tecnologias digitais',
        'Sustentabilidade',
        'Pesquisa de tendências'
      ],
      category: 'Artes e Design',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Pontifícia Universidade Católica',
      rating: 4.5,
      reviews: 223,
    ),

    Course(
      id: '28',
      title: 'Sistemas de Informação',
      description: 'Formação de profissionais para projetar, desenvolver e gerenciar sistemas de informação, integrando tecnologia da informação com as necessidades organizacionais.',
      areas: [
        'Desenvolvimento de Sistemas',
        'Gestão de TI',
        'Banco de Dados',
        'Redes de Computadores',
        'Business Intelligence',
        'Consultoria em TI',
        'Segurança da Informação'
      ],
      minSalary: 3200,
      maxSalary: 18000,
      competencies: [
        'Desenvolvimento de software',
        'Gestão de projetos de TI',
        'Banco de dados',
        'Redes e infraestrutura',
        'Business intelligence',
        'Governança de TI',
        'Segurança da informação'
      ],
      category: 'Tecnologia',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal de Pernambuco',
      rating: 4.6,
      reviews: 267,
    ),

    Course(
      id: '29',
      title: 'Agronomia',
      description: 'Formação de engenheiros agrônomos para atuar no desenvolvimento sustentável da produção agropecuária, desde o planejamento até a comercialização.',
      areas: [
        'Produção Vegetal',
        'Produção Animal',
        'Defesa Sanitária',
        'Mecanização Agrícola',
        'Gestão Rural',
        'Agricultura Sustentável',
        'Pesquisa Agropecuária'
      ],
      minSalary: 3500,
      maxSalary: 16000,
      competencies: [
        'Manejo de culturas',
        'Produção animal',
        'Mecanização agrícola',
        'Gestão rural',
        'Solos e fertilidade',
        'Defesa fitossanitária',
        'Agricultura sustentável'
      ],
      category: 'Agropecuária',
      duration: 10,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal de Viçosa',
      rating: 4.7,
      reviews: 245,
    ),

    Course(
      id: '30',
      title: 'Medicina Veterinária',
      description: 'Formação de médicos veterinários para atuar na saúde animal, produção de alimentos, inspeção sanitária e pesquisa em ciências veterinárias.',
      areas: [
        'Clínica de Pequenos Animais',
        'Clínica de Grandes Animais',
        'Produção Animal',
        'Inspeção de Produtos',
        'Saúde Pública Veterinária',
        'Pesquisa Científica',
        'Ensino Superior'
      ],
      minSalary: 3200,
      maxSalary: 15000,
      competencies: [
        'Diagnóstico veterinário',
        'Cirurgia veterinária',
        'Produção animal',
        'Inspeção sanitária',
        'Saúde pública',
        'Bem-estar animal',
        'Pesquisa científica'
      ],
      category: 'Saúde',
      duration: 10,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal Rural do Rio de Janeiro',
      rating: 4.6,
      reviews: 234,
    ),

    // ==================================================
    // CURSOS ADICIONADOS AUTOMATICAMENTE
    // ==================================================

    Course(
      id: '31',
      title: 'Arquitetura e Urbanismo',
      description: 'O curso de Arquitetura e Urbanismo forma profissionais capacitados para projetar, planejar e executar espaços urbanos e edificações, integrando aspectos estéticos, funcionais e sustentáveis. O arquiteto urbanista atua desde a concepção de projetos arquitetônicos até o desenvolvimento de soluções para o planejamento urbano e a preservação do patrimônio cultural.',
      areas: [
        'Projeto arquitetônico residencial e comercial',
        'Planejamento urbano e regional',
        'Paisagismo e design de espaços exteriores',
        'Restauro e conservação do patrimônio histórico',
        'Sustentabilidade e eficiência energética em edificações',
        'Gestão de obras e construção civil',
        'Consultoria em acessibilidade e normas técnicas'
      ],
      minSalary: 2500,
      maxSalary: 12000,
      competencies: [
        'Desenvolvimento de projetos arquitetônicos e urbanísticos',
        'Conhecimento em softwares de desenho e modelagem (AutoCAD, Revit, SketchUp)',
        'Análise crítica do espaço urbano e ambiental',
        'Capacidade de trabalhar em equipes multidisciplinares',
        'Gestão de tempo e recursos em projetos',
        'Comunicação eficaz com clientes e equipes técnicas',
        'Conhecimento das normas técnicas e legislações vigentes'
      ],
      category: 'Engenharia',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '32',
      title: 'Astronomia',
      description: 'O curso de Bacharelado em Astronomia forma profissionais capazes de estudar e analisar fenômenos celestes, utilizando técnicas observacionais e computacionais para compreender o universo. O egresso atua em pesquisa, desenvolvimento tecnológico e ensino, aplicando conhecimentos em física, matemática e computação para interpretar dados astronômicos.',
      areas: [
        'Pesquisa em astrofísica e cosmologia',
        'Observatórios astronômicos e planetários',
        'Desenvolvimento de software para análise de dados astronômicos',
        'Divulgação científica e educação em astronomia',
        'Desenvolvimento de instrumentos e tecnologias espaciais',
        'Agências espaciais e institutos de pesquisa',
        'Consultoria ambiental e geociências relacionadas ao espaço'
      ],
      minSalary: 3500,
      maxSalary: 12000,
      competencies: [
        'Análise e interpretação de dados astronômicos',
        'Conhecimento avançado em física e matemática aplicada',
        'Operação de instrumentos e telescópios astronômicos',
        'Programação e uso de softwares científicos',
        'Capacidade de pesquisa científica e elaboração de projetos',
        'Comunicação científica clara e objetiva',
        'Trabalho em equipe multidisciplinar'
      ],
      category: 'Ciências Exatas',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '33',
      title: 'Ciência da Computação',
      description: 'O curso de Ciência da Computação forma profissionais capacitados a projetar, desenvolver e gerenciar sistemas computacionais, além de atuar na pesquisa e inovação tecnológica. O egresso aprende fundamentos teóricos e práticos de programação, algoritmos, estruturas de dados, inteligência artificial e engenharia de software.',
      areas: [
        'Desenvolvimento de Software',
        'Inteligência Artificial e Machine Learning',
        'Segurança da Informação',
        'Engenharia de Software',
        'Computação em Nuvem',
        'Análise de Dados e Big Data',
        'Pesquisa e Desenvolvimento em Computação'
      ],
      minSalary: 3000,
      maxSalary: 15000,
      competencies: [
        'Programação avançada em diversas linguagens',
        'Desenvolvimento e manutenção de sistemas complexos',
        'Capacidade de análise e solução de problemas computacionais',
        'Trabalho em equipe e comunicação técnica',
        'Gestão de projetos de tecnologia',
        'Conhecimento de algoritmos e estruturas de dados',
        'Atualização contínua frente às inovações tecnológicas'
      ],
      category: 'Tecnologia',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '34',
      title: 'Design',
      description: 'O curso de Design Bacharelado forma profissionais capazes de criar soluções visuais e funcionais para diferentes mídias e produtos, integrando criatividade, tecnologia e pesquisa. O designer atua no desenvolvimento de projetos que envolvem desde a concepção até a execução, considerando aspectos estéticos, técnicos e de usabilidade.',
      areas: [
        'Design Gráfico',
        'Design de Produto',
        'Design de Interface e UX/UI',
        'Design de Embalagens',
        'Design de Comunicação Visual',
        'Design de Moda',
        'Design de Ambientes'
      ],
      minSalary: 2500,
      maxSalary: 9000,
      competencies: [
        'Domínio de softwares de criação e modelagem digital',
        'Capacidade de pesquisa e análise de tendências',
        'Desenvolvimento de projetos criativos e inovadores',
        'Habilidade em comunicação visual e narrativa',
        'Gestão de processos e equipes de design',
        'Conhecimento em ergonomia e usabilidade',
        'Pensamento crítico e resolução de problemas'
      ],
      category: 'Comunicação e Artes',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '35',
      title: 'Engenharia Aeronáutica',
      description: 'O curso de Engenharia Aeronáutica forma profissionais capacitados para projetar, desenvolver, analisar e gerenciar sistemas aeronáuticos, incluindo aeronaves e seus componentes. O engenheiro aeronáutico atua na aplicação de princípios da engenharia, física e materiais para garantir segurança, eficiência e inovação no setor aeroespacial.',
      areas: [
        'Projeto e desenvolvimento de aeronaves',
        'Manutenção e inspeção de sistemas aeronáuticos',
        'Ensaios e certificação de aeronaves',
        'Aeronáutica civil e militar',
        'Pesquisa e desenvolvimento em materiais aeronáuticos',
        'Gestão de produção e qualidade em indústrias aeroespaciais',
        'Sistemas de propulsão e motores aeronáuticos'
      ],
      minSalary: 6000,
      maxSalary: 18000,
      competencies: [
        'Domínio de aerodinâmica e estruturas aeronáuticas',
        'Capacidade de análise e simulação computacional',
        'Conhecimento em materiais avançados e compósitos',
        'Habilidades em gestão de projetos e equipes multidisciplinares',
        'Raciocínio crítico para solução de problemas complexos',
        'Comunicação técnica eficaz',
        'Conhecimento das normas e regulamentações da aviação'
      ],
      category: 'Engenharia',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '36',
      title: 'Engenharia Agrícola',
      description: 'O curso de Engenharia Agrícola forma profissionais capacitados a aplicar princípios de engenharia e tecnologia para otimizar sistemas agrícolas, integrando conhecimentos de mecanização, irrigação, manejo de solos e infraestrutura rural. O engenheiro agrícola atua no desenvolvimento e gestão de projetos que aumentam a produtividade agrícola com sustentabilidade e eficiência.',
      areas: [
        'Mecanização Agrícola',
        'Irrigação e Drenagem',
        'Construções Rurais e Infraestrutura',
        'Gestão de Recursos Hídricos',
        'Automação e Tecnologia Aplicada à Agricultura',
        'Sistemas de Produção Agrícola Sustentável',
        'Consultoria e Projetos Ambientais'
      ],
      minSalary: 3500,
      maxSalary: 12000,
      competencies: [
        'Análise e projeto de sistemas agrícolas mecanizados',
        'Planejamento e gestão de recursos hídricos',
        'Desenvolvimento de soluções tecnológicas para agricultura',
        'Capacidade de trabalhar com sustentabilidade e preservação ambiental',
        'Gerenciamento de projetos e equipes multidisciplinares',
        'Conhecimento em softwares de engenharia e automação',
        'Comunicação eficaz e tomada de decisão baseada em dados'
      ],
      category: 'Engenharia',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '37',
      title: 'Engenharia Biomédica',
      description: 'O curso de Engenharia Biomédica forma profissionais capazes de desenvolver, aplicar e gerenciar tecnologias e equipamentos na área da saúde, integrando conhecimentos de engenharia, biologia e medicina. O engenheiro biomédico atua na criação, manutenção e inovação de dispositivos médicos, sistemas de diagnóstico e tratamento, garantindo segurança e eficiência para pacientes e profissionais da saúde.',
      areas: [
        'Desenvolvimento de dispositivos médicos',
        'Automação hospitalar e gestão de equipamentos',
        'Imagens médicas e processamento de sinais biomédicos',
        'Engenharia de tecidos e biomateriais',
        'Telemedicina e sistemas de saúde digitais',
        'Pesquisa e desenvolvimento em tecnologia para reabilitação',
        'Manutenção e calibração de equipamentos biomédicos'
      ],
      minSalary: 3500,
      maxSalary: 12000,
      competencies: [
        'Conhecimento em eletrônica e sistemas embarcados aplicados à saúde',
        'Capacidade de projetar e validar dispositivos médicos',
        'Análise e interpretação de sinais e imagens médicas',
        'Conhecimento das normas e regulamentações sanitárias brasileiras',
        'Habilidade em gestão de projetos e equipes multidisciplinares',
        'Capacidade de inovação tecnológica e solução de problemas complexos',
        'Comunicação eficaz com profissionais da saúde e técnicos'
      ],
      category: 'Engenharia',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '38',
      title: 'Engenharia de Alimentos',
      description: 'O curso de Engenharia de Alimentos forma profissionais capacitados para atuar no desenvolvimento, produção, controle e melhoria de produtos alimentícios, garantindo segurança, qualidade e sustentabilidade. O engenheiro de alimentos aplica conhecimentos de química, microbiologia, engenharia e tecnologia para otimizar processos produtivos e inovar na indústria alimentícia.',
      areas: [
        'Indústria de processamento de alimentos',
        'Controle de qualidade e segurança alimentar',
        'Desenvolvimento de novos produtos alimentícios',
        'Consultoria ambiental e sustentabilidade na produção de alimentos',
        'Gestão de produção e logística na indústria alimentícia',
        'Controle microbiológico e análise laboratorial',
        'Pesquisa e desenvolvimento tecnológico'
      ],
      minSalary: 3500,
      maxSalary: 12000,
      competencies: [
        'Domínio de processos industriais e tecnologias de produção de alimentos',
        'Conhecimento em legislação e normas de segurança alimentar',
        'Capacidade de análise e controle de qualidade',
        'Habilidades em pesquisa e desenvolvimento de novos produtos',
        'Gestão de projetos e processos produtivos',
        'Trabalho em equipe e comunicação eficaz',
        'Pensamento crítico e solução de problemas complexos'
      ],
      category: 'Engenharia',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '39',
      title: 'Engenharia de Bioprocessos e Biotecnologia',
      description: 'O curso de Engenharia de Bioprocessos e Biotecnologia forma profissionais capacitados para desenvolver, otimizar e gerenciar processos biotecnológicos aplicados à indústria, saúde, agricultura e meio ambiente. O engenheiro aprende a manipular organismos vivos e sistemas biológicos para produção de bioprodutos, promovendo inovação sustentável e soluções tecnológicas.',
      areas: [
        'Indústria farmacêutica e de biotecnologia',
        'Produção de bioenergia e biocombustíveis',
        'Indústria alimentícia e de bebidas',
        'Tratamento e recuperação ambiental',
        'Pesquisa e desenvolvimento em bioprocessos',
        'Agroindústria e biotecnologia agrícola',
        'Controle de qualidade e regulação sanitária'
      ],
      minSalary: 4500,
      maxSalary: 15000,
      competencies: [
        'Projeto e otimização de bioprocessos industriais',
        'Manipulação genética e biologia molecular',
        'Análise e controle de qualidade de bioprodutos',
        'Gestão de projetos e equipes multidisciplinares',
        'Conhecimento em legislação ambiental e biossegurança',
        'Capacidade de inovação e desenvolvimento tecnológico',
        'Comunicação técnica e elaboração de relatórios científicos'
      ],
      category: 'Engenharia',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '40',
      title: 'Engenharia de Computação',
      description: 'O curso de Engenharia de Computação forma profissionais capacitados a projetar, desenvolver e integrar sistemas computacionais complexos, combinando conhecimentos de hardware e software. O engenheiro de computação atua na criação de soluções inovadoras que envolvem processamento de dados, automação e sistemas embarcados.',
      areas: [
        'Desenvolvimento de sistemas embarcados',
        'Automação industrial',
        'Sistemas de comunicação e redes',
        'Projetos de hardware e circuitos digitais',
        'Computação em nuvem e infraestrutura de TI',
        'Segurança da informação',
        'Inteligência artificial e aprendizado de máquina'
      ],
      minSalary: 4000,
      maxSalary: 15000,
      competencies: [
        'Programação avançada e desenvolvimento de software',
        'Projeto e análise de circuitos digitais',
        'Integração de sistemas hardware-software',
        'Gerenciamento de projetos tecnológicos',
        'Resolução de problemas complexos',
        'Trabalho em equipe multidisciplinar',
        'Comunicação técnica eficaz'
      ],
      category: 'Engenharia',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '41',
      title: 'Engenharia de Controle e Automação (Mecatrônica)',
      description: 'O curso de Engenharia de Controle e Automação (Mecatrônica) forma profissionais capacitados a projetar, desenvolver e implementar sistemas automatizados integrando conhecimentos de eletrônica, mecânica e computação. O egresso atua na otimização de processos industriais por meio de controle, automação e robótica, promovendo inovação tecnológica.',
      areas: [
        'Automação industrial',
        'Robótica e sistemas embarcados',
        'Controle de processos',
        'Manufatura avançada',
        'Sistemas de instrumentação',
        'Automação predial e residencial',
        'Desenvolvimento de software para sistemas automatizados'
      ],
      minSalary: 4000,
      maxSalary: 15000,
      competencies: [
        'Projeto e implementação de sistemas de controle automático',
        'Programação de controladores lógicos programáveis (CLPs)',
        'Desenvolvimento de algoritmos para robótica e automação',
        'Análise e modelagem de sistemas dinâmicos',
        'Integração de sistemas eletromecânicos',
        'Trabalho em equipe multidisciplinar',
        'Capacidade de inovação e resolução de problemas complexos'
      ],
      category: 'Engenharia',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '42',
      title: 'Engenharia de Materiais',
      description: 'O curso de Engenharia de Materiais forma profissionais capacitados para desenvolver, analisar e aprimorar materiais utilizados em diversos setores industriais, desde metais até polímeros e cerâmicas. O engenheiro de materiais atua na inovação tecnológica, garantindo propriedades específicas para aplicações em engenharia, indústria automotiva, aeroespacial, biomédica, entre outras.',
      areas: [
        'Desenvolvimento de novos materiais',
        'Controle de qualidade e análise de materiais',
        'Engenharia de processos e manufatura',
        'Pesquisa e desenvolvimento (P&D) em materiais avançados',
        'Reciclagem e sustentabilidade de materiais',
        'Engenharia biomédica de materiais',
        'Indústria aeroespacial e automotiva'
      ],
      minSalary: 4000,
      maxSalary: 15000,
      competencies: [
        'Análise e caracterização de materiais',
        'Projeto e desenvolvimento de materiais com propriedades específicas',
        'Conhecimento em técnicas de fabricação e processos industriais',
        'Capacidade de pesquisa e inovação tecnológica',
        'Tomada de decisão baseada em dados técnicos',
        'Trabalho em equipe multidisciplinar',
        'Comunicação técnica e elaboração de relatórios'
      ],
      category: 'Engenharia',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '43',
      title: 'Engenharia de Minas',
      description: 'O curso de Engenharia de Minas forma profissionais capazes de planejar, operar e gerenciar a extração de minerais de forma eficiente e sustentável. O engenheiro de minas atua no desenvolvimento de técnicas para exploração, beneficiamento e recuperação ambiental, garantindo a segurança e viabilidade econômica das atividades mineradoras.',
      areas: [
        'Planejamento e Projeto de Mina',
        'Geologia de Minas',
        'Operações de Lavra e Beneficiamento',
        'Gestão Ambiental e Recuperação de Áreas Degradadas',
        'Segurança e Saúde no Trabalho em Mineração',
        'Consultoria e Perícias Técnicas em Mineração',
        'Tecnologia e Automação de Processos Minerários'
      ],
      minSalary: 4500,
      maxSalary: 15000,
      competencies: [
        'Análise e interpretação de dados geológicos e minerais',
        'Planejamento e gerenciamento de operações de lavra',
        'Conhecimento em técnicas de beneficiamento mineral',
        'Aplicação de normas de segurança e meio ambiente',
        'Capacidade de liderança e trabalho em equipe multidisciplinar',
        'Uso de softwares específicos de modelagem e simulação',
        'Tomada de decisão baseada em critérios econômicos e técnicos'
      ],
      category: 'Engenharia',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '44',
      title: 'Engenharia de Pesca',
      description: 'O curso de Engenharia de Pesca forma profissionais capacitados para atuar no desenvolvimento, manejo, conservação e exploração sustentável dos recursos pesqueiros e aquícolas. O engenheiro de pesca aplica conhecimentos técnicos e científicos para otimizar processos produtivos, garantir a qualidade dos produtos e promover a sustentabilidade ambiental.',
      areas: [
        'Aquicultura e criação de organismos aquáticos',
        'Manejo e conservação de recursos pesqueiros',
        'Tecnologia e processamento de pescado',
        'Engenharia de equipamentos e instalações pesqueiras',
        'Gestão ambiental e sustentabilidade em ecossistemas aquáticos',
        'Pesquisa e desenvolvimento em biotecnologia pesqueira',
        'Consultoria e planejamento de atividades pesqueiras'
      ],
      minSalary: 3500,
      maxSalary: 12000,
      competencies: [
        'Análise e manejo de ecossistemas aquáticos',
        'Desenvolvimento e otimização de sistemas de aquicultura',
        'Conhecimento em legislação ambiental e pesqueira',
        'Projetos de engenharia para unidades produtivas pesqueiras',
        'Capacidade de pesquisa e inovação tecnológica',
        'Gestão de recursos naturais renováveis',
        'Trabalho em equipe e comunicação técnica'
      ],
      category: 'Engenharia',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '45',
      title: 'Engenharia de Petróleo',
      description: 'O curso de Engenharia de Petróleo capacita profissionais para atuar no desenvolvimento, exploração e produção de petróleo e gás natural, aplicando conhecimentos técnicos em geologia, perfuração, reservatórios e processamento. O engenheiro de petróleo é responsável por otimizar a extração de recursos energéticos de forma segura e sustentável.',
      areas: [
        'Exploração e produção de petróleo e gás',
        'Perfuração de poços',
        'Engenharia de reservatórios',
        'Gestão ambiental e segurança operacional',
        'Tecnologia de recuperação avançada de petróleo',
        'Planejamento e operação de plataformas offshore',
        'Análise de viabilidade econômica de campos petrolíferos'
      ],
      minSalary: 6000,
      maxSalary: 20000,
      competencies: [
        'Análise e interpretação de dados geológicos e geofísicos',
        'Projeto e supervisão de operações de perfuração',
        'Modelagem e simulação de reservatórios',
        'Gestão de riscos e segurança no trabalho',
        'Tomada de decisão baseada em análise técnica e econômica',
        'Trabalho em equipe multidisciplinar',
        'Comunicação técnica e elaboração de relatórios'
      ],
      category: 'Engenharia',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '46',
      title: 'Engenharia de Telecomunicações',
      description: 'O curso de Engenharia de Telecomunicações forma profissionais capacitados para projetar, implementar e gerenciar sistemas e redes de comunicação, utilizando tecnologias digitais, analógicas e de rádio frequência. O engenheiro de telecomunicações atua no desenvolvimento de soluções para transmissão de dados, voz e vídeo, além de garantir a eficiência e segurança dos sistemas de comunicação.',
      areas: [
        'Redes de Comunicação de Dados',
        'Comunicações Móveis e Celulares',
        'Sistemas de Rádio e TV Digital',
        'Internet das Coisas (IoT)',
        'Satélites e Comunicações Espaciais',
        'Planejamento e Gestão de Redes de Telecomunicações',
        'Segurança da Informação em Telecomunicações'
      ],
      minSalary: 4500,
      maxSalary: 15000,
      competencies: [
        'Projeto e análise de sistemas de comunicação',
        'Configuração e gerenciamento de redes',
        'Conhecimento em protocolos e padrões de telecomunicações',
        'Desenvolvimento e aplicação de tecnologias digitais e analógicas',
        'Capacidade de trabalhar com sistemas embarcados e IoT',
        'Análise crítica e solução de problemas técnicos',
        'Comunicação eficaz e trabalho em equipe multidisciplinar'
      ],
      category: 'Engenharia',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '47',
      title: 'Engenharia Florestal',
      description: 'O curso de Engenharia Florestal forma profissionais capacitados para planejar, implementar e gerenciar o uso sustentável dos recursos florestais, integrando conhecimentos de biologia, ecologia e tecnologia. O engenheiro florestal atua na conservação ambiental, manejo de florestas nativas e plantadas, além de promover a recuperação de áreas degradadas.',
      areas: [
        'Manejo e conservação de florestas nativas',
        'Silvicultura e reflorestamento comercial',
        'Gestão ambiental e recuperação de áreas degradadas',
        'Planejamento e gestão de unidades de conservação',
        'Produção sustentável de madeira e produtos não madeireiros',
        'Consultoria ambiental e auditorias florestais',
        'Pesquisa e desenvolvimento em recursos naturais renováveis'
      ],
      minSalary: 3500,
      maxSalary: 12000,
      competencies: [
        'Elaboração de planos de manejo florestal sustentável',
        'Análise e monitoramento ambiental',
        'Uso de tecnologias para inventário e geoprocessamento',
        'Capacidade de trabalho interdisciplinar e em campo',
        'Tomada de decisão baseada em princípios de sustentabilidade',
        'Planejamento e execução de projetos ambientais',
        'Comunicação eficaz com comunidades e stakeholders'
      ],
      category: 'Engenharia',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '48',
      title: 'Engenharia Naval',
      description: 'O curso de Engenharia Naval forma profissionais capacitados para projetar, construir, operar e manter embarcações, plataformas marítimas e estruturas navais. O engenheiro naval desenvolve conhecimentos em hidrodinâmica, resistência dos materiais e sistemas de propulsão, aplicando-os na indústria naval, offshore e de transporte aquaviário.',
      areas: [
        'Projeto e construção de embarcações',
        'Manutenção e reparo naval',
        'Engenharia offshore e plataformas petrolíferas',
        'Sistemas de propulsão naval',
        'Inspeção e certificação de embarcações',
        'Gestão de operações portuárias',
        'Pesquisa e desenvolvimento em tecnologia naval'
      ],
      minSalary: 4000,
      maxSalary: 13000,
      competencies: [
        'Análise estrutural e hidrodinâmica',
        'Projeto assistido por computador (CAD/CAM)',
        'Gestão de projetos navais',
        'Conhecimento em sistemas de propulsão e energia',
        'Capacidade de trabalhar em equipes multidisciplinares',
        'Tomada de decisão baseada em normas técnicas e ambientais',
        'Comunicação técnica e elaboração de relatórios'
      ],
      category: 'Engenharia',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '49',
      title: 'Estatística',
      description: 'O curso de Estatística forma profissionais capazes de coletar, analisar e interpretar dados para apoiar a tomada de decisões em diversas áreas. O estatístico desenvolve modelos probabilísticos e utiliza métodos quantitativos para resolver problemas complexos do mercado, setor público e pesquisa científica.',
      areas: [
        'Análise de dados e Data Science',
        'Pesquisa de mercado e opinião',
        'Estatística aplicada à saúde',
        'Controle de qualidade industrial',
        'Modelagem financeira e atuária',
        'Setor público e políticas públicas',
        'Pesquisa acadêmica e ensino'
      ],
      minSalary: 3000,
      maxSalary: 12000,
      competencies: [
        'Domínio de técnicas estatísticas e probabilísticas',
        'Capacidade de modelagem e análise de dados',
        'Habilidade em programação e uso de softwares estatísticos',
        'Interpretação crítica de resultados e comunicação clara',
        'Tomada de decisão baseada em evidências',
        'Trabalho em equipe multidisciplinar',
        'Raciocínio lógico e pensamento analítico'
      ],
      category: 'Ciências Exatas',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '50',
      title: 'Física',
      description: 'O curso de Física Bacharelado forma profissionais capacitados para compreender, modelar e investigar fenômenos naturais por meio de métodos científicos e matemáticos. O egresso atua na pesquisa, desenvolvimento tecnológico e aplicação de conhecimentos físicos em diversos setores industriais, acadêmicos e governamentais.',
      areas: [
        'Pesquisa científica em universidades e institutos',
        'Desenvolvimento e inovação tecnológica em indústrias',
        'Análise e instrumentação em laboratórios de física aplicada',
        'Consultoria técnica em áreas de energia e meio ambiente',
        'Atuação em instituições de ensino e divulgação científica',
        'Física médica e radioterapia',
        'Modelagem computacional e simulações físicas'
      ],
      minSalary: 3500,
      maxSalary: 12000,
      competencies: [
        'Capacidade de aplicar métodos experimentais e teóricos na solução de problemas',
        'Domínio de técnicas de modelagem matemática e computacional',
        'Habilidade para operar e desenvolver instrumentos científicos',
        'Capacidade analítica para interpretar dados complexos',
        'Comunicação científica clara e objetiva, tanto escrita quanto oral',
        'Trabalho colaborativo em equipes multidisciplinares',
        'Iniciativa para inovação e desenvolvimento tecnológico'
      ],
      category: 'Ciências Exatas',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '51',
      title: 'Geofísica',
      description: 'O curso de Geofísica Bacharelado forma profissionais capacitados para aplicar métodos físicos na investigação do interior da Terra, utilizando tecnologias avançadas para exploração de recursos naturais, análise ambiental e estudos geológicos. O geofísico atua na coleta, processamento e interpretação de dados geofísicos para auxiliar na tomada de decisões em setores como mineração, petróleo, meio ambiente e engenharia.',
      areas: [
        'Exploração de petróleo e gás',
        'Mineração e prospecção mineral',
        'Geologia ambiental e estudos de impacto',
        'Hidrogeofísica e recursos hídricos',
        'Geofísica aplicada à engenharia civil',
        'Sismologia e monitoramento geotécnico',
        'Geofísica marinha e oceanografia'
      ],
      minSalary: 3500,
      maxSalary: 12000,
      competencies: [
        'Análise e interpretação de dados geofísicos',
        'Operação de equipamentos geofísicos modernos',
        'Modelagem computacional e simulação geofísica',
        'Trabalho multidisciplinar e comunicação técnica',
        'Capacidade de planejamento e execução de levantamentos de campo',
        'Gestão de projetos e análise de risco geológico',
        'Raciocínio crítico e resolução de problemas complexos'
      ],
      category: 'Ciências Exatas',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '52',
      title: 'Geologia',
      description: 'O curso de Geologia Bacharelado forma profissionais capacitados para estudar a composição, estrutura e processos da Terra, aplicando conhecimentos para exploração de recursos naturais, avaliação ambiental e mitigação de riscos geológicos. O geólogo atua em pesquisas, análises e consultorias voltadas para setores como mineração, petróleo, meio ambiente e planejamento territorial.',
      areas: [
        'Geologia de exploração mineral',
        'Geologia do petróleo e gás',
        'Geologia ambiental e avaliação de riscos',
        'Geotecnia e engenharia geológica',
        'Hidrogeologia',
        'Geologia marinha',
        'Geoprocessamento e sensoriamento remoto'
      ],
      minSalary: 3500,
      maxSalary: 15000,
      competencies: [
        'Análise e interpretação de dados geológicos',
        'Realização de levantamentos e mapeamentos geológicos',
        'Uso de softwares de geoprocessamento e modelagem 3D',
        'Avaliação de impactos ambientais',
        'Planejamento e execução de projetos de exploração',
        'Trabalho em equipe multidisciplinar',
        'Comunicação técnica e elaboração de relatórios'
      ],
      category: 'Ciências Exatas',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '53',
      title: 'Matemática',
      description: 'O curso de Matemática Bacharelado forma profissionais capacitados para atuar em áreas que envolvem modelagem matemática, análise quantitativa e desenvolvimento de soluções para problemas complexos. O egresso desenvolve habilidades para aplicar teorias matemáticas em pesquisa, indústria, tecnologia e ensino superior.',
      areas: [
        'Pesquisa e desenvolvimento em matemática aplicada',
        'Análise de dados e estatística',
        'Modelagem matemática e simulação computacional',
        'Desenvolvimento de algoritmos e ciência de dados',
        'Consultoria em empresas de tecnologia e finanças',
        'Atuação em instituições financeiras e seguradoras',
        'Ensino em nível superior e pós-graduação'
      ],
      minSalary: 3500,
      maxSalary: 12000,
      competencies: [
        'Raciocínio lógico e pensamento crítico avançado',
        'Capacidade de modelar e resolver problemas complexos',
        'Domínio de ferramentas computacionais e linguagens de programação',
        'Análise e interpretação de dados quantitativos',
        'Comunicação clara de conceitos matemáticos',
        'Trabalho colaborativo em equipes multidisciplinares',
        'Autonomia para pesquisa e estudo contínuo'
      ],
      category: 'Ciências Exatas',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '54',
      title: 'Meteorologia',
      description: 'O curso de Meteorologia forma profissionais capacitados para analisar, prever e interpretar fenômenos atmosféricos, utilizando ferramentas científicas e tecnológicas. O bacharel em Meteorologia atua em áreas como previsão do tempo, estudos climáticos e monitoramento ambiental, contribuindo para a tomada de decisões em diversos setores.',
      areas: [
        'Previsão meteorológica para mídia e agências governamentais',
        'Monitoramento e análise climática para órgãos ambientais',
        'Meteorologia agrícola e gestão de riscos agropecuários',
        'Consultoria em gestão de desastres naturais e eventos extremos',
        'Pesquisa científica em climatologia e mudanças climáticas',
        'Meteorologia aplicada à aviação e transporte',
        'Desenvolvimento de modelos computacionais e sistemas meteorológicos'
      ],
      minSalary: 3500,
      maxSalary: 12000,
      competencies: [
        'Análise e interpretação de dados meteorológicos e climáticos',
        'Domínio de ferramentas computacionais para modelagem atmosférica',
        'Capacidade de comunicação clara para divulgação científica e técnica',
        'Tomada de decisão baseada em informações meteorológicas',
        'Trabalho interdisciplinar com áreas ambientais, agrícolas e tecnológicas',
        'Planejamento e execução de projetos de pesquisa',
        'Adaptabilidade a mudanças rápidas e situações de emergência'
      ],
      category: 'Ciências Exatas',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '55',
      title: 'Oceanografia',
      description: 'O curso de Oceanografia capacita profissionais para estudar os oceanos e ambientes costeiros, aplicando conhecimentos científicos e tecnológicos para a gestão, preservação e exploração sustentável dos recursos marinhos. O oceanógrafo atua em pesquisa, monitoramento ambiental, planejamento costeiro e desenvolvimento de tecnologias ligadas ao meio marinho.',
      areas: [
        'Pesquisa oceanográfica',
        'Gestão ambiental costeira',
        'Monitoramento e conservação marinha',
        'Indústria de petróleo e gás offshore',
        'Aquicultura e pesca sustentável',
        'Planejamento e desenvolvimento costeiro',
        'Consultoria ambiental'
      ],
      minSalary: 3500,
      maxSalary: 12000,
      competencies: [
        'Análise e interpretação de dados oceanográficos',
        'Operação de equipamentos de coleta e monitoramento marinho',
        'Desenvolvimento de projetos de pesquisa e gestão ambiental',
        'Conhecimento em legislação ambiental e marítima',
        'Trabalho em equipe multidisciplinar',
        'Comunicação científica e técnica',
        'Capacidade de planejamento e tomada de decisão'
      ],
      category: 'Ciências Exatas',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '56',
      title: 'Química',
      description: 'O curso de Química Bacharelado forma profissionais capacitados para atuar na pesquisa, desenvolvimento e controle de qualidade de produtos e processos químicos em diversos setores industriais. O bacharel em Química desenvolve conhecimentos sólidos em química orgânica, inorgânica, analítica, físico-química e instrumental, aplicando-os em soluções inovadoras e sustentáveis.',
      areas: [
        'Indústria farmacêutica',
        'Análises ambientais',
        'Controle de qualidade industrial',
        'Pesquisa e desenvolvimento (P&D)',
        'Produção química e petroquímica',
        'Ensino e divulgação científica',
        'Tecnologia de materiais e polímeros'
      ],
      minSalary: 2500,
      maxSalary: 9000,
      competencies: [
        'Realização de análises químicas qualitativas e quantitativas',
        'Desenvolvimento e otimização de processos químicos',
        'Interpretação e aplicação de normas técnicas e de segurança',
        'Utilização de equipamentos laboratoriais e técnicas instrumentais',
        'Capacidade de pesquisa científica e inovação tecnológica',
        'Trabalho em equipe e comunicação técnica eficaz',
        'Planejamento e gestão de projetos laboratoriais'
      ],
      category: 'Ciências Exatas',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '57',
      title: 'Sistemas de Informação',
      description: 'O curso de Sistemas de Informação forma profissionais capazes de projetar, desenvolver, implementar e gerenciar soluções tecnológicas que atendam às necessidades organizacionais. O bacharel aprende a integrar conhecimentos de computação, gestão e negócios para otimizar processos e apoiar a tomada de decisão nas empresas.',
      areas: [
        'Desenvolvimento de Software',
        'Análise e Gerenciamento de Sistemas',
        'Gestão de Banco de Dados',
        'Segurança da Informação',
        'Consultoria em Tecnologia da Informação',
        'Administração de Redes e Infraestrutura',
        'Business Intelligence e Análise de Dados'
      ],
      minSalary: 2500,
      maxSalary: 12000,
      competencies: [
        'Programação e desenvolvimento de aplicações',
        'Modelagem e análise de sistemas',
        'Gerenciamento de projetos de TI',
        'Administração de bancos de dados',
        'Segurança da informação e proteção de dados',
        'Comunicação eficaz e trabalho em equipe',
        'Capacidade de resolver problemas complexos'
      ],
      category: 'Tecnologia',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '58',
      title: 'Biomedicina',
      description: 'O curso de Biomedicina forma profissionais capacitados para atuar na análise e diagnóstico de doenças, desenvolvimento de pesquisas científicas e aplicação de técnicas laboratoriais avançadas. O biomédico integra conhecimentos de biologia, química e tecnologia para contribuir na saúde pública, laboratorial e biotecnologia.',
      areas: [
        'Análises Clínicas',
        'Imagem e Diagnóstico por Imagem',
        'Biologia Molecular e Genética',
        'Banco de Sangue',
        'Microbiologia e Parasitologia',
        'Imunologia',
        'Pesquisa Científica e Desenvolvimento'
      ],
      minSalary: 2500,
      maxSalary: 9000,
      competencies: [
        'Realizar exames laboratoriais com precisão e segurança',
        'Interpretar resultados clínicos para diagnóstico',
        'Aplicar técnicas de biologia molecular e genética',
        'Desenvolver e conduzir pesquisas científicas',
        'Utilizar tecnologias avançadas em diagnóstico por imagem',
        'Atuar de forma ética e responsável na área da saúde',
        'Comunicar-se efetivamente com equipes multidisciplinares'
      ],
      category: 'Saúde',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '59',
      title: 'Ciências Biológicas',
      description: 'O curso de Ciências Biológicas (Bacharelado) forma profissionais capazes de atuar em pesquisas, análises e aplicações práticas relacionadas aos seres vivos e seus ecossistemas. O bacharel em Ciências Biológicas desenvolve conhecimentos em biologia molecular, ecologia, genética, zoologia e botânica, preparando-se para resolver problemas ambientais, biotecnológicos e educacionais.',
      areas: [
        'Pesquisa científica em biologia molecular e celular',
        'Gestão ambiental e conservação da biodiversidade',
        'Biotecnologia e desenvolvimento de produtos biológicos',
        'Análise e monitoramento de ecossistemas',
        'Docência e educação ambiental',
        'Consultoria ambiental e licenciamento',
        'Controle e manejo de fauna e flora'
      ],
      minSalary: 2500,
      maxSalary: 8000,
      competencies: [
        'Capacidade de realizar pesquisas científicas e experimentos laboratoriais',
        'Análise e interpretação de dados biológicos',
        'Elaboração e execução de projetos ambientais',
        'Conhecimento em técnicas de biotecnologia e genética',
        'Habilidade para trabalhar em equipes multidisciplinares',
        'Comunicação científica clara e eficaz',
        'Tomada de decisão ética e sustentável em contextos ambientais'
      ],
      category: 'Saúde',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '60',
      title: 'Educação Física',
      description: 'O curso de Educação Física Bacharelado forma profissionais capacitados para atuar na promoção, prevenção e reabilitação da saúde por meio da atividade física, esporte e lazer. O egresso desenvolve conhecimentos teóricos e práticos para planejar, executar e avaliar programas de treinamento, condicionamento físico e reabilitação em diferentes contextos.',
      areas: [
        'Personal trainer',
        'Treinamento esportivo de alto rendimento',
        'Reabilitação física e fisiologia do exercício',
        'Atividade física para saúde e qualidade de vida',
        'Gestão esportiva e de academias',
        'Educação física escolar e recreação',
        'Prescrição de exercícios para grupos especiais'
      ],
      minSalary: 2000,
      maxSalary: 8000,
      competencies: [
        'Avaliação física e funcional',
        'Planejamento e prescrição de exercícios físicos',
        'Conhecimento em fisiologia do exercício e biomecânica',
        'Habilidades de comunicação e orientação técnica',
        'Capacidade de trabalhar em equipe multidisciplinar',
        'Gestão de projetos e programas de atividade física',
        'Ética profissional e promoção da saúde'
      ],
      category: 'Saúde',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '61',
      title: 'Fisioterapia',
      description: 'O curso de Fisioterapia forma profissionais capacitados a prevenir, diagnosticar e tratar disfunções do movimento humano, utilizando recursos terapêuticos manuais, eletroterapia, exercícios e outras técnicas. O fisioterapeuta atua em diversas áreas da saúde, promovendo a recuperação funcional e a melhora da qualidade de vida dos pacientes.',
      areas: [
        'Fisioterapia Ortopédica e Traumatológica',
        'Fisioterapia Neurológica',
        'Fisioterapia Respiratória',
        'Fisioterapia Esportiva',
        'Fisioterapia em Saúde da Mulher',
        'Fisioterapia Cardiovascular',
        'Fisioterapia Geriátrica'
      ],
      minSalary: 2200,
      maxSalary: 8000,
      competencies: [
        'Avaliação e diagnóstico fisioterapêutico',
        'Elaboração e execução de planos de tratamento individualizados',
        'Utilização de recursos terapêuticos manuais e eletroterapêuticos',
        'Atuação multiprofissional e interdisciplinar',
        'Comunicação eficaz com pacientes e equipe de saúde',
        'Capacidade de adaptação e resolução de problemas clínicos',
        'Ética profissional e responsabilidade social'
      ],
      category: 'Saúde',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '62',
      title: 'Fonoaudiologia',
      description: 'O curso de Fonoaudiologia forma profissionais capacitados para prevenir, diagnosticar e tratar distúrbios da comunicação humana, incluindo voz, fala, linguagem, audição e funções orofaciais. O fonoaudiólogo atua em diferentes contextos clínicos, escolares e hospitalares, promovendo a reabilitação e a melhoria da qualidade de vida dos pacientes.',
      areas: [
        'Audiologia',
        'Linguagem e Desenvolvimento Infantil',
        'Motricidade Orofacial',
        'Voz Profissional',
        'Fonoaudiologia Educacional',
        'Fonoaudiologia Hospitalar',
        'Neurofuncional'
      ],
      minSalary: 2500,
      maxSalary: 7000,
      competencies: [
        'Avaliação e diagnóstico de distúrbios da comunicação',
        'Elaboração e execução de planos terapêuticos personalizados',
        'Uso de tecnologia assistiva e recursos audiológicos',
        'Atuação interdisciplinar com equipes de saúde e educação',
        'Comunicação eficaz com pacientes e familiares',
        'Capacidade de adaptação a diferentes faixas etárias e necessidades',
        'Ética profissional e responsabilidade social'
      ],
      category: 'Saúde',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '63',
      title: 'Odontologia',
      description: 'O curso de Odontologia forma profissionais capacitados para diagnosticar, prevenir e tratar doenças e condições bucais, promovendo a saúde oral e geral dos pacientes. O bacharel desenvolve conhecimentos teóricos e práticos em anatomia, fisiologia, patologia, além de técnicas clínicas para atendimento odontológico humanizado.',
      areas: [
        'Odontologia Preventiva',
        'Odontologia Estética',
        'Ortodontia',
        'Endodontia',
        'Cirurgia Bucomaxilofacial',
        'Periodontia',
        'Odontopediatria'
      ],
      minSalary: 3000,
      maxSalary: 12000,
      competencies: [
        'Realizar diagnóstico clínico e radiográfico',
        'Executar procedimentos restauradores e cirúrgicos',
        'Aplicar técnicas de prevenção e promoção da saúde bucal',
        'Gerenciar atendimento ao paciente com ética e humanização',
        'Interpretar exames complementares relacionados à saúde oral',
        'Planejar tratamentos odontológicos integrados',
        'Atualizar-se continuamente sobre novas tecnologias e práticas'
      ],
      category: 'Saúde',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '64',
      title: 'Saúde Coletiva',
      description: 'O curso de Saúde Coletiva forma profissionais capacitados a planejar, coordenar e avaliar ações de promoção, prevenção e vigilância em saúde pública. O bacharel desenvolve conhecimentos em epidemiologia, políticas públicas, gestão de serviços de saúde e determinantes sociais da saúde para atuar em diferentes contextos populacionais.',
      areas: [
        'Vigilância Epidemiológica',
        'Gestão de Programas de Saúde Pública',
        'Promoção da Saúde e Educação em Saúde',
        'Análise de Políticas Públicas de Saúde',
        'Monitoramento e Avaliação de Serviços de Saúde',
        'Vigilância Sanitária e Ambiental',
        'Pesquisa em Saúde Coletiva'
      ],
      minSalary: 2500,
      maxSalary: 8000,
      competencies: [
        'Análise crítica de dados epidemiológicos',
        'Planejamento e implementação de programas de saúde',
        'Comunicação efetiva com comunidades e equipes multiprofissionais',
        'Gerenciamento de recursos e serviços de saúde',
        'Elaboração e avaliação de políticas públicas',
        'Capacidade de pesquisa e produção científica',
        'Ética e responsabilidade social na saúde pública'
      ],
      category: 'Saúde',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '65',
      title: 'Terapia Ocupacional',
      description: 'O curso de Terapia Ocupacional prepara o profissional para promover a saúde e a autonomia de indivíduos com limitações físicas, mentais ou sociais, por meio de atividades terapêuticas. O terapeuta ocupacional atua na reabilitação, prevenção e inclusão social, desenvolvendo intervenções personalizadas que favorecem a funcionalidade e a qualidade de vida.',
      areas: [
        'Reabilitação física e neurológica',
        'Saúde mental e psiquiatria',
        'Pediatria e desenvolvimento infantil',
        'Geriatria e cuidados com idosos',
        'Inclusão social e educação especial',
        'Ergonomia e saúde do trabalhador',
        'Atendimento em clínicas e hospitais'
      ],
      minSalary: 2500,
      maxSalary: 7000,
      competencies: [
        'Avaliação funcional e elaboração de planos terapêuticos',
        'Aplicação de técnicas de reabilitação e adaptação',
        'Trabalho interdisciplinar e comunicação eficaz',
        'Empatia e habilidades de escuta ativa',
        'Capacidade de análise crítica e resolução de problemas',
        'Planejamento e desenvolvimento de atividades ocupacionais',
        'Conhecimento em políticas públicas de saúde e assistência social'
      ],
      category: 'Saúde',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '66',
      title: 'Zootecnia',
      description: 'O curso de Zootecnia forma profissionais capacitados para planejar, gerir e executar atividades relacionadas à produção animal, visando a otimização da eficiência produtiva, qualidade dos produtos e bem-estar dos animais. O zootecnista atua no desenvolvimento de técnicas para melhoramento genético, nutrição, manejo e sanidade dos rebanhos.',
      areas: [
        'Produção e melhoramento genético de animais',
        'Nutrição animal e formulação de rações',
        'Manejo e bem-estar animal',
        'Gestão e consultoria em propriedades rurais',
        'Sanidade e controle de doenças em rebanhos',
        'Tecnologia de produtos de origem animal',
        'Pesquisa e desenvolvimento em ciências animais'
      ],
      minSalary: 2500,
      maxSalary: 8000,
      competencies: [
        'Análise e planejamento da produção animal',
        'Conhecimento em genética e melhoramento de rebanhos',
        'Formulação de dietas balanceadas para diferentes espécies',
        'Capacidade de manejo sustentável e de bem-estar animal',
        'Habilidades em gestão e administração rural',
        'Interpretação de dados científicos e aplicação tecnológica',
        'Comunicação eficaz e trabalho em equipe multidisciplinar'
      ],
      category: 'Ciências Agrárias',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '67',
      title: 'Antropologia',
      description: 'O curso de Antropologia Bacharelado forma profissionais capazes de analisar e interpretar as diversidades culturais, sociais e biológicas humanas, com foco em pesquisa e intervenção social. O antropólogo desenvolve estudos sobre grupos humanos, suas práticas, crenças e relações, aplicando metodologias qualitativas e quantitativas para compreender dinâmicas sociais.',
      areas: [
        'Pesquisa acadêmica e científica',
        'Consultoria em políticas públicas e desenvolvimento social',
        'Antropologia aplicada em empresas e organizações',
        'Patrimônio cultural e museologia',
        'Antropologia médica e saúde coletiva',
        'Antropologia ambiental e sustentabilidade',
        'Consultoria para projetos de diversidade e inclusão'
      ],
      minSalary: 2500,
      maxSalary: 9000,
      competencies: [
        'Análise crítica e interpretação de dados sociais e culturais',
        'Domínio de metodologias qualitativas e quantitativas de pesquisa',
        'Capacidade de comunicação interdisciplinar e multicultural',
        'Elaboração e gestão de projetos de pesquisa e intervenção',
        'Ética e responsabilidade social na atuação profissional',
        'Habilidade em trabalho de campo e coleta de dados',
        'Produção e divulgação científica em antropologia'
      ],
      category: 'Ciências Humanas',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '68',
      title: 'Arqueologia',
      description: 'O curso de Arqueologia forma profissionais capacitados para identificar, analisar e interpretar vestígios materiais do passado, contribuindo para a preservação do patrimônio histórico e cultural. O arqueólogo atua em pesquisas, escavações e estudos que auxiliam na compreensão das sociedades antigas e sua relação com o presente.',
      areas: [
        'Pesquisa acadêmica e científica',
        'Gestão e preservação do patrimônio arqueológico',
        'Arqueologia de campo e escavações',
        'Museologia e curadoria de coleções arqueológicas',
        'Consultoria ambiental e arqueológica para empreendimentos',
        'Educação patrimonial e divulgação científica',
        'Trabalho em órgãos governamentais de cultura e patrimônio'
      ],
      minSalary: 2500,
      maxSalary: 8000,
      competencies: [
        'Capacidade de realizar escavações e análises de sítios arqueológicos',
        'Interpretação de dados históricos e materiais arqueológicos',
        'Conhecimento em legislação de patrimônio cultural',
        'Habilidades em documentação e catalogação de artefatos',
        'Trabalho em equipe multidisciplinar',
        'Comunicação científica e produção de relatórios técnicos',
        'Ética profissional e responsabilidade social'
      ],
      category: 'Ciências Humanas',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '69',
      title: 'Arquivologia',
      description: 'O curso de Arquivologia forma profissionais capacitados para gerir, organizar, conservar e disponibilizar documentos e informações em diferentes formatos, assegurando sua autenticidade e integridade. O arquivista atua na gestão documental, preservação da memória institucional e atendimento às demandas legais e sociais relacionadas aos arquivos.',
      areas: [
        'Arquivo Público',
        'Arquivo Privado Empresarial',
        'Arquivo Audiovisual e Digital',
        'Gestão de Documentos e Informação',
        'Memória Institucional e Patrimônio Documental',
        'Arquivo Judicial e Cartorário',
        'Tecnologia da Informação em Arquivologia'
      ],
      minSalary: 2500,
      maxSalary: 7000,
      competencies: [
        'Organização e classificação de documentos',
        'Elaboração de planos de gestão documental',
        'Preservação e conservação de arquivos',
        'Utilização de sistemas de informação arquivística',
        'Análise e avaliação de documentos para destinação',
        'Capacidade de pesquisa e revisão histórica',
        'Habilidades de comunicação e atendimento ao público'
      ],
      category: 'Ciências Humanas',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '70',
      title: 'Artes Cênicas',
      description: 'O curso de Artes Cênicas forma profissionais capacitados para atuar na criação, interpretação e produção de espetáculos teatrais, performances e outras manifestações artísticas. O bacharel desenvolve habilidades técnicas e teóricas para trabalhar como ator, diretor, produtor e pesquisador no campo das artes cênicas.',
      areas: [
        'Atuação teatral',
        'Direção teatral',
        'Produção cultural e artística',
        'Dramaturgia e roteiro',
        'Educação e mediação cultural',
        'Cenografia e iluminação',
        'Performance e artes integradas'
      ],
      minSalary: 1800,
      maxSalary: 6500,
      competencies: [
        'Interpretação cênica e expressão corporal',
        'Criação e desenvolvimento de personagens',
        'Análise e pesquisa teatral',
        'Direção de atores e processos criativos',
        'Planejamento e gestão de projetos culturais',
        'Comunicação verbal e não verbal',
        'Trabalho em equipe e colaboração interdisciplinar'
      ],
      category: 'Comunicação e Artes',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '71',
      title: 'Artes Visuais',
      description: 'O curso de Artes Visuais Bacharelado forma profissionais capazes de criar, interpretar e analisar obras visuais em diversas linguagens e suportes. O egresso desenvolve habilidades técnicas e conceituais para atuar em processos criativos, produção artística, curadoria e pesquisa no campo das artes visuais.',
      areas: [
        'Produção artística contemporânea',
        'Curadoria de exposições e eventos culturais',
        'Ilustração e design gráfico',
        'Arte digital e multimídia',
        'Ensino e mediação cultural',
        'Restauração e conservação de obras de arte',
        'Pesquisa e crítica em artes visuais'
      ],
      minSalary: 1800,
      maxSalary: 7000,
      competencies: [
        'Domínio de técnicas tradicionais e digitais de criação visual',
        'Capacidade de análise crítica e interpretação estética',
        'Planejamento e execução de projetos artísticos',
        'Conhecimento em história e teoria da arte',
        'Habilidade para trabalhar em equipe multidisciplinar',
        'Comunicação visual eficaz',
        'Adaptabilidade e inovação em processos criativos'
      ],
      category: 'Comunicação e Artes',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '72',
      title: 'Biblioteconomia',
      description: 'O curso de Biblioteconomia forma profissionais capacitados para organizar, gerenciar e disseminar informações em diferentes tipos de acervos e ambientes informacionais. O bibliotecário atua na gestão de bibliotecas, arquivos, centros de documentação e sistemas de informação, utilizando tecnologias para facilitar o acesso ao conhecimento.',
      areas: [
        'Bibliotecas acadêmicas e escolares',
        'Centros de documentação e informação técnica',
        'Arquivos públicos e privados',
        'Empresas de tecnologia da informação',
        'Museus e instituições culturais',
        'Organização de eventos e curadoria digital',
        'Consultoria em gestão da informação'
      ],
      minSalary: 1800,
      maxSalary: 6500,
      competencies: [
        'Catalogação e classificação de documentos',
        'Gestão de acervos e coleções',
        'Uso de tecnologias da informação aplicadas à biblioteconomia',
        'Desenvolvimento de serviços de referência e atendimento ao usuário',
        'Planejamento e organização de processos informacionais',
        'Capacidade de pesquisa e análise de informações',
        'Comunicação eficaz e trabalho em equipe'
      ],
      category: 'Ciências Humanas',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '73',
      title: 'Ciência Política',
      description: 'O curso de Ciência Política forma profissionais capacitados a analisar, interpretar e atuar nos processos políticos, sociais e institucionais, compreendendo as dinâmicas de poder, governança e políticas públicas. O bacharel desenvolve habilidades para pesquisa, planejamento estratégico e consultoria em diversas esferas do setor público e privado.',
      areas: [
        'Assessoria e consultoria política',
        'Análise e elaboração de políticas públicas',
        'Pesquisa acadêmica e aplicada',
        'Gestão pública e governança',
        'Organizações não governamentais (ONGs) e movimentos sociais',
        'Instituições internacionais e diplomacia',
        'Comunicação política e marketing eleitoral'
      ],
      minSalary: 2800,
      maxSalary: 12000,
      competencies: [
        'Análise crítica de sistemas políticos e sociais',
        'Pesquisa qualitativa e quantitativa em ciências sociais',
        'Elaboração e avaliação de políticas públicas',
        'Capacidade de argumentação e negociação',
        'Interpretação de dados estatísticos e indicadores sociais',
        'Comunicação clara e persuasiva',
        'Ética e responsabilidade social'
      ],
      category: 'Ciências Humanas',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '74',
      title: 'Ciências Sociais (Sociologia)',
      description: 'O curso de Ciências Sociais (Sociologia) forma profissionais capacitados para analisar e interpretar fenômenos sociais, culturais e políticos, utilizando métodos científicos. O bacharel desenvolve habilidades para atuar em pesquisa, planejamento e formulação de políticas públicas, além de promover a compreensão crítica das dinâmicas sociais no Brasil e no mundo.',
      areas: [
        'Pesquisa Social e Análise de Dados',
        'Consultoria e Assessoria em Políticas Públicas',
        'Organizações Não Governamentais (ONGs)',
        'Empresas Privadas - Responsabilidade Social e Sustentabilidade',
        'Educação e Extensão Cultural',
        'Mídia e Comunicação Social',
        'Gestão de Projetos Sociais'
      ],
      minSalary: 2500,
      maxSalary: 8000,
      competencies: [
        'Elaboração e condução de pesquisas qualitativas e quantitativas',
        'Análise crítica de contextos sociais e culturais',
        'Interpretação e produção de relatórios técnicos e acadêmicos',
        'Comunicação clara e eficaz, tanto oral quanto escrita',
        'Planejamento e gestão de projetos sociais',
        'Trabalho interdisciplinar e em equipes multidisciplinares',
        'Capacidade de adaptação a diferentes contextos sociais e institucionais'
      ],
      category: 'Ciências Humanas',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '75',
      title: 'Cinema e Audiovisual',
      description: 'O curso de Cinema e Audiovisual forma profissionais capacitados para criar, produzir e dirigir obras audiovisuais, como filmes, séries, documentários e conteúdos digitais. O aluno desenvolve habilidades técnicas e artísticas para atuar em todas as etapas da produção audiovisual, desde a concepção até a finalização.',
      areas: [
        'Direção de cinema e televisão',
        'Roteirização para cinema e TV',
        'Produção audiovisual',
        'Edição e pós-produção',
        'Fotografia cinematográfica',
        'Sonorização e design de áudio',
        'Distribuição e curadoria de filmes'
      ],
      minSalary: 1800,
      maxSalary: 9000,
      competencies: [
        'Criação e desenvolvimento de roteiros',
        'Operação de equipamentos de filmagem e iluminação',
        'Edição e montagem de imagens e áudio',
        'Gestão de projetos e produção audiovisual',
        'Análise crítica e estética do audiovisual',
        'Trabalho em equipe e comunicação interpessoal',
        'Capacidade de adaptação a novas tecnologias'
      ],
      category: 'Comunicação e Artes',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '76',
      title: 'Dança',
      description: 'O Bacharelado em Dança prepara profissionais para atuarem na criação, interpretação, pesquisa e difusão da dança em suas diversas linguagens. O curso desenvolve competências técnicas, artísticas e teóricas, capacitando o estudante para atuar em cenários artísticos, educacionais e culturais.',
      areas: [
        'Companhia e produção artística de dança',
        'Coreografia e criação de performances',
        'Ensino de dança em escolas e instituições culturais',
        'Pesquisa e documentação da dança',
        'Gestão e produção cultural no segmento da dança',
        'Dança em projetos sociais e comunitários',
        'Crítica e curadoria de dança'
      ],
      minSalary: 1800,
      maxSalary: 7000,
      competencies: [
        'Domínio técnico e expressivo em diferentes estilos de dança',
        'Capacidade de criação coreográfica e desenvolvimento de projetos artísticos',
        'Conhecimento histórico, teórico e cultural da dança',
        'Habilidade para ministrar aulas e workshops',
        'Capacidade de trabalho em equipe e comunicação',
        'Gestão de eventos e produção cultural',
        'Pesquisa e análise crítica da dança'
      ],
      category: 'Comunicação e Artes',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '77',
      title: 'Filosofia',
      description: 'O curso de Filosofia Bacharelado forma profissionais capazes de analisar criticamente conceitos, argumentos e problemas fundamentais da existência humana, da ética, da política e do conhecimento. O egresso desenvolve habilidades para atuar em pesquisa, ensino, consultoria e áreas que demandam pensamento crítico e reflexivo.',
      areas: [
        'Pesquisa acadêmica e científica',
        'Ensino superior e educação continuada',
        'Consultoria em ética e responsabilidade social',
        'Análise crítica em instituições culturais e museus',
        'Produção e curadoria de conteúdo filosófico',
        'Assessoria em políticas públicas e direitos humanos',
        'Mediação e facilitação de debates e conflitos'
      ],
      minSalary: 2500,
      maxSalary: 9000,
      competencies: [
        'Capacidade de análise crítica e argumentativa',
        'Domínio de métodos de pesquisa filosófica',
        'Comunicação clara e persuasiva, oral e escrita',
        'Raciocínio lógico e resolução de problemas complexos',
        'Interpretação e contextualização histórica de ideias',
        'Ética profissional e responsabilidade social',
        'Trabalho colaborativo e interdisciplinar'
      ],
      category: 'Ciências Humanas',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '78',
      title: 'Gastronomia',
      description: 'O curso de Gastronomia forma profissionais capacitados a planejar, preparar e gerir alimentos e bebidas, com foco na qualidade, segurança alimentar e inovação culinária. O bacharel em Gastronomia desenvolve conhecimentos técnicos e gerenciais para atuar em diferentes segmentos da cadeia produtiva alimentar, promovendo experiências gastronômicas sustentáveis e culturalmente relevantes.',
      areas: [
        'Cozinha profissional e alta gastronomia',
        'Gestão de alimentos e bebidas em restaurantes e hotéis',
        'Consultoria e desenvolvimento de cardápios',
        'Pesquisa e inovação em gastronomia',
        'Eventos gastronômicos e catering',
        'Ensino e formação em gastronomia',
        'Empreendedorismo gastronômico'
      ],
      minSalary: 1800,
      maxSalary: 7500,
      competencies: [
        'Manipulação segura e higienização de alimentos',
        'Desenvolvimento e execução de técnicas culinárias tradicionais e contemporâneas',
        'Gestão de custos e controle de estoque',
        'Planejamento e organização de ambientes de trabalho',
        'Criatividade e inovação na elaboração de pratos',
        'Comunicação eficaz e trabalho em equipe',
        'Capacidade de adaptação às tendências e demandas do mercado'
      ],
      category: 'Turismo e Hospitalidade',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '79',
      title: 'Geografia',
      description: 'O curso de Geografia Bacharelado forma profissionais capacitados a analisar e interpretar fenômenos naturais e sociais no espaço geográfico, utilizando métodos cartográficos, estatísticos e tecnológicos. O geógrafo atua em planejamento territorial, gestão ambiental e desenvolvimento sustentável, aplicando conhecimentos multidisciplinares para resolver problemas regionais e urbanos.',
      areas: [
        'Geoprocessamento e Sensoriamento Remoto',
        'Planejamento Urbano e Regional',
        'Gestão Ambiental',
        'Cartografia e Sistemas de Informação Geográfica (SIG)',
        'Geografia Econômica e do Desenvolvimento',
        'Climatologia e Recursos Naturais',
        'Pesquisa e Ensino'
      ],
      minSalary: 2500,
      maxSalary: 8000,
      competencies: [
        'Análise espacial e interpretação de dados geográficos',
        'Elaboração e interpretação de mapas e SIG',
        'Planejamento e gestão territorial',
        'Capacidade crítica e pesquisa científica',
        'Comunicação técnica e científica',
        'Conhecimento em legislação ambiental e territorial',
        'Trabalho em equipe e interdisciplinaridade'
      ],
      category: 'Ciências Humanas',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '80',
      title: 'História',
      description: 'O curso de História Bacharelado forma profissionais capacitados para analisar, interpretar e pesquisar processos históricos, sociais e culturais, aplicando métodos científicos para compreender as dinâmicas do passado e suas relações com o presente. O egresso atua em diferentes contextos, produzindo conhecimento histórico e contribuindo para a preservação da memória e valorização da cultura.',
      areas: [
        'Pesquisa histórica em instituições acadêmicas e centros de pesquisa',
        'Consultoria e assessoria em órgãos públicos e privados',
        'Museus e centros de memória',
        'Produção e curadoria de conteúdo para mídia e editoras',
        'Arquivos públicos e privados',
        'Organizações não governamentais (ONGs) com foco em patrimônio cultural',
        'Docência em cursos livres e extensão cultural'
      ],
      minSalary: 2500,
      maxSalary: 8000,
      competencies: [
        'Análise crítica e interpretação de fontes históricas',
        'Domínio de metodologias de pesquisa e ensino da História',
        'Capacidade de comunicação clara e objetiva, oral e escrita',
        'Planejamento e execução de projetos de pesquisa e preservação',
        'Raciocínio lógico e pensamento interdisciplinar',
        'Sensibilidade cultural e ética profissional',
        'Uso de tecnologias para pesquisa e divulgação histórica'
      ],
      category: 'Ciências Humanas',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '81',
      title: 'Letras (Língua Portuguesa / Estrangeiras)',
      description: 'O curso de Letras (Língua Portuguesa / Estrangeiras) Bacharelado forma profissionais capacitados para atuar em ensino, pesquisa, tradução, revisão e produção textual, com domínio aprofundado das línguas e suas literaturas. O egresso desenvolve habilidades linguísticas, culturais e pedagógicas para atuar em diferentes contextos educacionais e profissionais.',
      areas: [
        'Ensino de Língua Portuguesa e Línguas Estrangeiras',
        'Tradução e Interpretação',
        'Revisão e Produção Editorial',
        'Consultoria Linguística para empresas e instituições',
        'Pesquisa em Linguística e Literatura',
        'Elaboração de materiais didáticos',
        'Atuação em tecnologia aplicada à linguagem (ex.: análise de dados linguísticos, softwares educacionais)'
      ],
      minSalary: 2500,
      maxSalary: 7000,
      competencies: [
        'Domínio avançado da língua portuguesa e pelo menos uma língua estrangeira',
        'Capacidade de análise linguística e literária',
        'Habilidade para elaboração e aplicação de metodologias pedagógicas',
        'Competência em tradução e interpretação de textos',
        'Produção e revisão de textos técnicos e acadêmicos',
        'Capacidade de pesquisa científica e análise crítica',
        'Comunicação eficaz e trabalho em equipe'
      ],
      category: 'Educação',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '82',
      title: 'Museologia',
      description: 'O curso de Museologia forma profissionais capacitados para gerenciar, preservar, pesquisar e difundir o patrimônio cultural e museológico. O museólogo atua na organização, curadoria, conservação e mediação do acervo em museus e instituições culturais, promovendo o acesso e a valorização da memória histórica.',
      areas: [
        'Curadoria e gestão de acervos',
        'Conservação e restauro de bens culturais',
        'Educação e mediação cultural em museus',
        'Pesquisa e documentação museológica',
        'Planejamento e organização de exposições',
        'Gestão de políticas culturais e patrimônio',
        'Atuação em museus comunitários e instituições culturais'
      ],
      minSalary: 2500,
      maxSalary: 7000,
      competencies: [
        'Conhecimento técnico em catalogação e documentação de acervos',
        'Habilidade em conservação preventiva e restauro básico',
        'Capacidade de planejamento e desenvolvimento de exposições',
        'Domínio de técnicas de mediação e educação cultural',
        'Competência em pesquisa e análise histórica e cultural',
        'Gestão de projetos culturais e eventos museológicos',
        'Comunicação eficaz e trabalho em equipe multidisciplinar'
      ],
      category: 'Ciências Humanas',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '83',
      title: 'Música',
      description: 'O curso de Música (Bacharelado) forma profissionais capacitados para a interpretação, composição, regência e produção musical, além do ensino e pesquisa na área. O estudante desenvolve habilidades técnicas, teóricas e práticas para atuar em diversos contextos artísticos e culturais.',
      areas: [
        'Performance musical (instrumental e vocal)',
        'Composição e arranjo musical',
        'Regência orquestral e coral',
        'Produção e engenharia de áudio',
        'Educação musical e docência',
        'Pesquisa musicológica e etnomusicologia',
        'Trilhas sonoras para audiovisual e mídias digitais'
      ],
      minSalary: 1800,
      maxSalary: 8000,
      competencies: [
        'Domínio técnico em instrumento ou voz',
        'Leitura e análise musical avançada',
        'Criatividade na composição e improvisação',
        'Habilidade de regência e liderança de grupos musicais',
        'Conhecimento em tecnologias de gravação e produção sonora',
        'Capacidade de planejamento e execução de projetos musicais',
        'Comunicação eficaz e trabalho colaborativo'
      ],
      category: 'Comunicação e Artes',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '84',
      title: 'Publicidade e Propaganda',
      description: 'O curso de Publicidade e Propaganda forma profissionais capacitados a planejar, criar e executar estratégias de comunicação e marketing para diferentes mídias e públicos. O estudante desenvolve habilidades em criação publicitária, pesquisa de mercado, planejamento de campanhas e análise de comportamento do consumidor.',
      areas: [
        'Agências de publicidade e marketing',
        'Mídias digitais e redes sociais',
        'Planejamento de comunicação e mídia',
        'Criação e direção de arte',
        'Pesquisa de mercado e comportamento do consumidor',
        'Marketing promocional e eventos',
        'Consultoria em comunicação corporativa'
      ],
      minSalary: 2500,
      maxSalary: 9000,
      competencies: [
        'Criatividade e inovação na elaboração de campanhas',
        'Domínio das ferramentas digitais e softwares gráficos',
        'Capacidade de análise de dados e pesquisa de mercado',
        'Comunicação oral e escrita eficaz',
        'Planejamento estratégico de comunicação',
        'Trabalho em equipe e gestão de projetos',
        'Adaptabilidade às tendências do mercado publicitário'
      ],
      category: 'Comunicação e Artes',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '85',
      title: 'Rádio, TV e Internet',
      description: 'O curso de Rádio, TV e Internet forma profissionais capacitados para produzir, dirigir e gerenciar conteúdos audiovisuais em diferentes plataformas, incluindo rádio, televisão e mídias digitais. O aluno desenvolve habilidades técnicas e criativas para atuar em todas as etapas da produção, além de compreender aspectos culturais, sociais e tecnológicos da comunicação audiovisual.',
      areas: [
        'Produção e direção de programas de TV',
        'Roteirização e edição de conteúdos para internet',
        'Jornalismo radiofônico e digital',
        'Gerenciamento de mídias audiovisuais',
        'Trilha sonora e design de áudio',
        'Consultoria em comunicação audiovisual',
        'Criação e produção de podcasts'
      ],
      minSalary: 2500,
      maxSalary: 7000,
      competencies: [
        'Domínio de técnicas de captação e edição de áudio e vídeo',
        'Conhecimento em roteirização e narrativa audiovisual',
        'Capacidade de planejamento e produção multimídia',
        'Habilidade em gestão de projetos e equipes de produção',
        'Conhecimento das legislações e normas do setor audiovisual',
        'Criatividade e inovação na criação de conteúdos',
        'Comunicação eficaz e trabalho em equipe'
      ],
      category: 'Comunicação e Artes',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '86',
      title: 'Relações Públicas',
      description: 'O curso de Relações Públicas forma profissionais capacitados para planejar, executar e avaliar estratégias de comunicação entre organizações e seus públicos, promovendo a imagem institucional e a gestão de crises. O profissional aprende a desenvolver ações integradas de comunicação, assessoria de imprensa, eventos e responsabilidade social.',
      areas: [
        'Assessoria de Imprensa',
        'Comunicação Corporativa',
        'Eventos e Cerimonial',
        'Gestão de Crises',
        'Responsabilidade Social Empresarial',
        'Mídias Digitais e Redes Sociais',
        'Consultoria em Comunicação'
      ],
      minSalary: 2500,
      maxSalary: 9000,
      competencies: [
        'Elaboração de planos de comunicação',
        'Gestão de relacionamento com públicos internos e externos',
        'Produção e divulgação de conteúdo para diferentes mídias',
        'Organização e produção de eventos',
        'Análise e gestão de crises de imagem',
        'Domínio de ferramentas digitais e redes sociais',
        'Habilidades de negociação e mediação'
      ],
      category: 'Comunicação e Artes',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '87',
      title: 'Secretariado Executivo',
      description: 'O curso de Secretariado Executivo Bacharelado prepara profissionais para atuar no apoio administrativo e estratégico de empresas e instituições, gerenciando informações, agenda e comunicação organizacional. O profissional desenvolve habilidades em gestão, comunicação corporativa, protocolo, organização de eventos e tecnologia aplicada ao ambiente executivo.',
      areas: [
        'Secretariado Executivo em empresas privadas',
        'Assessoria e apoio a executivos e gestores',
        'Gestão de comunicação interna e externa',
        'Organização e coordenação de eventos corporativos',
        'Secretariado em órgãos públicos e instituições governamentais',
        'Gestão documental e arquivística',
        'Consultoria em processos administrativos'
      ],
      minSalary: 2500,
      maxSalary: 7000,
      competencies: [
        'Comunicação eficaz e redação corporativa',
        'Domínio de ferramentas tecnológicas e sistemas de informação',
        'Gestão de tempo e organização de agendas',
        'Protocolo e cerimonial empresarial',
        'Capacidade de negociação e resolução de conflitos',
        'Trabalho em equipe e liderança',
        'Planejamento e execução de eventos'
      ],
      category: 'Gestão e Negócios',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '88',
      title: 'Serviço Social',
      description: 'O curso de Serviço Social qualifica o profissional para atuar na promoção da justiça social, defesa dos direitos humanos e desenvolvimento de políticas públicas. O bacharel desenvolve competências para analisar contextos sociais, planejar e executar intervenções em diferentes áreas da sociedade.',
      areas: [
        'Assistência Social',
        'Saúde Pública',
        'Educação',
        'Direitos Humanos',
        'Políticas Públicas',
        'Sistema Prisional',
        'Organizações Não Governamentais (ONGs)'
      ],
      minSalary: 1800,
      maxSalary: 7000,
      competencies: [
        'Análise crítica da realidade social',
        'Elaboração e gestão de políticas sociais',
        'Atendimento e orientação social',
        'Pesquisa social aplicada',
        'Mediação e resolução de conflitos',
        'Comunicação interpessoal e trabalho em equipe',
        'Ética profissional e responsabilidade social'
      ],
      category: 'Ciências Humanas',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '89',
      title: 'Teatro',
      description: 'O curso de Teatro (Bacharelado) forma profissionais capacitados para atuar na criação, interpretação e produção teatral, desenvolvendo habilidades artísticas e técnicas para diversas linguagens e formatos cênicos. O egresso está apto a trabalhar em espetáculos, produções audiovisuais, pesquisa e ensino, com foco na expressão corporal, vocal e na dramaturgia.',
      areas: [
        'Atuação teatral',
        'Direção cênica',
        'Dramaturgia',
        'Produção cultural',
        'Educação em teatro',
        'Teatro para televisão e cinema',
        'Pesquisa e crítica teatral'
      ],
      minSalary: 1500,
      maxSalary: 7000,
      competencies: [
        'Expressão corporal e vocal',
        'Interpretação e criação de personagens',
        'Leitura e análise de textos dramáticos',
        'Planejamento e execução de projetos cênicos',
        'Trabalho colaborativo em equipe artística',
        'Capacidade de improvisação e adaptação',
        'Conhecimento de história e teoria do teatro'
      ],
      category: 'Comunicação e Artes',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '90',
      title: 'Teologia',
      description: 'O curso de Teologia Bacharelado prepara profissionais para o estudo aprofundado das religiões, das escrituras sagradas e das práticas pastorais, capacitando-os a atuar em contextos religiosos, sociais e educacionais. O teólogo desenvolve habilidades para interpretar textos sagrados, oferecer aconselhamento espiritual e promover o diálogo inter-religioso.',
      areas: [
        'Ministério pastoral e liderança religiosa',
        'Aconselhamento e orientação espiritual',
        'Ensino religioso e educação cristã',
        'Pesquisa e estudos teológicos',
        'Gestão de instituições religiosas',
        'Mediação e diálogo inter-religioso',
        'Atuação em organizações não governamentais e sociais'
      ],
      minSalary: 1800,
      maxSalary: 7000,
      competencies: [
        'Interpretação crítica de textos sagrados',
        'Comunicação e oratória',
        'Capacidade de aconselhamento e escuta ativa',
        'Conhecimento em ética e moral religiosa',
        'Gestão de conflitos e mediação',
        'Pesquisa acadêmica e produção de conhecimento',
        'Sensibilidade cultural e respeito à diversidade religiosa'
      ],
      category: 'Ciências Humanas',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '91',
      title: 'Turismo',
      description: 'O curso de Turismo forma profissionais capacitados para planejar, organizar e gerenciar serviços turísticos, promovendo o desenvolvimento sustentável e a valorização cultural. O bacharel em Turismo atua na criação de experiências turísticas, análise de mercados e gestão de empreendimentos relacionados ao setor.',
      areas: [
        'Agenciamento e Operação de Viagens',
        'Gestão de Meios de Hospedagem',
        'Turismo Cultural e Patrimonial',
        'Ecoturismo e Turismo de Aventura',
        'Planejamento e Desenvolvimento Turístico',
        'Eventos e Turismo de Negócios',
        'Marketing Turístico'
      ],
      minSalary: 1800,
      maxSalary: 7000,
      competencies: [
        'Planejamento e organização de serviços turísticos',
        'Análise e pesquisa de mercado turístico',
        'Gestão de empreendimentos turísticos',
        'Comunicação eficaz e atendimento ao cliente',
        'Conhecimento de legislação e políticas públicas do turismo',
        'Sustentabilidade e responsabilidade socioambiental',
        'Habilidades em marketing e promoção turística'
      ],
      category: 'Turismo e Hospitalidade',
      duration: 8,
      degreeType: 'Bacharelado',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '92',
      title: 'Artes Visuais',
      description: 'O curso de Artes Visuais (Licenciatura) forma profissionais capacitados para atuar no ensino de artes em diferentes níveis da educação básica, além de desenvolver projetos artísticos e culturais. O aluno aprende técnicas de desenho, pintura, escultura, história da arte e pedagogia, preparando-se para aplicar metodologias que estimulem a criatividade e a expressão artística dos estudantes.',
      areas: [
        'Docência em escolas públicas e privadas',
        'Mediação cultural em museus e galerias',
        'Produção e curadoria artística',
        'Criação e gestão de projetos culturais',
        'Ilustração e design gráfico',
        'Atuação em ONGs e projetos sociais com foco em arte',
        'Consultoria em educação artística'
      ],
      minSalary: 1800,
      maxSalary: 5500,
      competencies: [
        'Domínio de técnicas artísticas tradicionais e contemporâneas',
        'Capacidade de planejar e ministrar aulas de artes',
        'Habilidade em análise e crítica de obras de arte',
        'Competência para desenvolver projetos culturais e educativos',
        'Criatividade e inovação na produção artística',
        'Comunicação eficaz e trabalho colaborativo',
        'Conhecimento em políticas públicas e legislação educacional'
      ],
      category: 'Comunicação e Artes',
      duration: 8,
      degreeType: 'Licenciatura',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '93',
      title: 'Ciências Biológicas',
      description: 'O curso de Ciências Biológicas (Licenciatura) forma profissionais capacitados para atuar no ensino de Biologia na educação básica, além de desenvolver habilidades para a pesquisa científica e a promoção da conservação ambiental. O egresso compreende os fundamentos biológicos e pedagógicos necessários para planejar e executar atividades educativas que promovam o conhecimento e a valorização da biodiversidade.',
      areas: [
        'Ensino de Biologia na Educação Básica',
        'Educação Ambiental em Escolas e Comunidades',
        'Pesquisa Científica em Biologia Educacional',
        'Desenvolvimento de Materiais Didáticos em Ciências',
        'Gestão e Coordenação Pedagógica em Escolas',
        'Projetos de Divulgação Científica',
        'Consultoria em Educação Ambiental'
      ],
      minSalary: 2500,
      maxSalary: 7000,
      competencies: [
        'Planejamento e aplicação de aulas de Biologia',
        'Uso de metodologias ativas e recursos didáticos inovadores',
        'Avaliação e acompanhamento do processo de aprendizagem',
        'Conhecimento aprofundado em Biologia e suas áreas correlatas',
        'Capacidade de comunicação clara e motivadora',
        'Desenvolvimento de projetos educacionais e ambientais',
        'Trabalho colaborativo e ética profissional'
      ],
      category: 'Saúde',
      duration: 8,
      degreeType: 'Licenciatura',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '94',
      title: 'Ciências da Religião',
      description: 'O curso de Ciências da Religião (Licenciatura) forma profissionais capazes de analisar, interpretar e ensinar sobre as diversas manifestações religiosas no Brasil e no mundo, promovendo o diálogo inter-religioso e o respeito à diversidade cultural. O egresso está preparado para atuar na educação básica, pesquisa e mediação cultural, articulando conhecimento teórico e prático sobre as religiões.',
      areas: [
        'Ensino Fundamental e Médio em Escolas Públicas e Privadas',
        'Pesquisa em Ciências da Religião e áreas afins',
        'Mediação e Diálogo Inter-religioso em comunidades e instituições',
        'Consultoria para organizações governamentais e não governamentais',
        'Produção de conteúdo educacional e cultural',
        'Atuação em museus e espaços culturais',
        'Organização de eventos e atividades de educação patrimonial e religiosa'
      ],
      minSalary: 2200,
      maxSalary: 5500,
      competencies: [
        'Compreensão crítica das diferentes tradições religiosas e suas influências socioculturais',
        'Capacidade de planejar, desenvolver e avaliar práticas pedagógicas em ensino religioso',
        'Habilidade para promover o diálogo ecumênico e inter-religioso',
        'Domínio de metodologias de pesquisa qualitativa e quantitativa',
        'Comunicação clara e ética com públicos diversos',
        'Sensibilidade cultural e respeito à diversidade religiosa',
        'Elaboração de projetos educacionais e culturais'
      ],
      category: 'Ciências Humanas',
      duration: 8,
      degreeType: 'Licenciatura',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '95',
      title: 'Ciências Sociais',
      description: 'O curso de Ciências Sociais (Licenciatura) forma profissionais capacitados para atuar no ensino de sociologia, antropologia e ciência política em escolas de ensino médio e fundamental, além de desenvolver pesquisas e análises sociais. O licenciado aprende teorias sociais, métodos de pesquisa e práticas pedagógicas para promover o pensamento crítico e a compreensão das dinâmicas sociais.',
      areas: [
        'Ensino de Sociologia e Ciências Sociais em escolas públicas e privadas',
        'Elaboração e coordenação de projetos educativos e culturais',
        'Pesquisa social acadêmica e aplicada',
        'Assessoria e consultoria em políticas públicas e sociais',
        'Produção e análise de conteúdo em mídias educativas',
        'Atuação em ONGs e organizações comunitárias',
        'Gestão de programas sociais e educativos'
      ],
      minSalary: 2200,
      maxSalary: 6500,
      competencies: [
        'Domínio das teorias sociais e antropológicas',
        'Capacidade de planejar e ministrar aulas para diferentes públicos',
        'Habilidade em pesquisa qualitativa e quantitativa',
        'Desenvolvimento de pensamento crítico e analítico',
        'Comunicação clara e didática',
        'Trabalho colaborativo e interdisciplinar',
        'Sensibilidade sociocultural e ética profissional'
      ],
      category: 'Ciências Humanas',
      duration: 8,
      degreeType: 'Licenciatura',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '96',
      title: 'Computação (Licenciatura em Computação)',
      description: 'O curso de Licenciatura em Computação prepara profissionais para atuar no ensino de informática e computação em escolas de ensino fundamental e médio, além de desenvolver habilidades para criar materiais didáticos e aplicar tecnologias educacionais. O licenciado também está apto a promover a inclusão digital e contribuir para a formação crítica dos alunos no uso das novas tecnologias.',
      areas: [
        'Ensino de computação em escolas públicas e privadas',
        'Desenvolvimento de materiais didáticos digitais',
        'Tecnologias educacionais e inclusão digital',
        'Coordenação de projetos de informática educacional',
        'Formação continuada de professores em tecnologias da informação',
        'Consultoria em educação tecnológica',
        'Pesquisa em metodologias de ensino de computação'
      ],
      minSalary: 2500,
      maxSalary: 6500,
      competencies: [
        'Planejamento e aplicação de aulas de computação',
        'Desenvolvimento de recursos pedagógicos digitais',
        'Domínio de linguagens de programação básicas',
        'Capacidade de integrar tecnologia ao processo educacional',
        'Comunicação clara e didática para o ensino',
        'Avaliação e adaptação de conteúdos conforme o perfil dos alunos',
        'Trabalho colaborativo e gestão de sala de aula'
      ],
      category: 'Tecnologia',
      duration: 8,
      degreeType: 'Licenciatura',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '97',
      title: 'Educação do Campo',
      description: 'O curso de Educação do Campo (Licenciatura) forma profissionais capacitados a atuar na educação básica de comunidades rurais, promovendo práticas pedagógicas contextualizadas e valorizando saberes locais. O licenciado desenvolve habilidades para planejar, implementar e avaliar processos educativos que considerem as especificidades culturais, sociais e econômicas do campo.',
      areas: [
        'Ensino fundamental em escolas rurais',
        'Educação indígena e quilombola',
        'Projetos de desenvolvimento comunitário',
        'Formação de educadores do campo',
        'Educação ambiental e sustentabilidade',
        'Gestão escolar em contextos rurais',
        'Políticas públicas de educação do campo'
      ],
      minSalary: 1800,
      maxSalary: 4500,
      competencies: [
        'Planejamento pedagógico contextualizado',
        'Mediação de processos educativos interculturais',
        'Desenvolvimento de materiais didáticos adaptados ao campo',
        'Trabalho colaborativo com comunidades locais',
        'Avaliação inclusiva e formativa',
        'Conhecimento das políticas educacionais rurais',
        'Capacidade de promover a sustentabilidade socioambiental'
      ],
      category: 'Educação',
      duration: 8,
      degreeType: 'Licenciatura',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '98',
      title: 'Educação Especial',
      description: 'O curso de Educação Especial (Licenciatura) forma profissionais capacitados para atuar na inclusão e no atendimento educacional especializado de pessoas com necessidades educacionais especiais. O licenciado desenvolve conhecimentos sobre diferentes deficiências, transtornos e altas habilidades, promovendo práticas pedagógicas adaptadas e inclusivas.',
      areas: [
        'Atendimento Educacional Especializado em escolas regulares',
        'Coordenação de projetos de inclusão escolar',
        'Assessoria pedagógica para alunos com necessidades especiais',
        'Intervenção em instituições de reabilitação e centros de apoio',
        'Formação continuada de professores para práticas inclusivas',
        'Elaboração e adaptação de materiais didáticos acessíveis',
        'Trabalho em políticas públicas de educação inclusiva'
      ],
      minSalary: 2200,
      maxSalary: 6000,
      competencies: [
        'Planejamento e implementação de estratégias pedagógicas inclusivas',
        'Avaliação das necessidades educacionais especiais dos alunos',
        'Adaptação curricular e uso de recursos tecnológicos assistivos',
        'Comunicação e trabalho colaborativo com famílias e equipes multidisciplinares',
        'Capacidade de identificação e intervenção em diferentes tipos de deficiência',
        'Sensibilidade cultural e ética no atendimento educacional',
        'Desenvolvimento de práticas de mediação e suporte para a inclusão'
      ],
      category: 'Educação',
      duration: 8,
      degreeType: 'Licenciatura',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '99',
      title: 'Educação Física',
      description: 'O curso de Licenciatura em Educação Física forma profissionais capacitados para atuar no ensino fundamental e médio, promovendo a educação, o desenvolvimento motor e a saúde por meio da prática de atividades físicas. O licenciado aprende a planejar, executar e avaliar projetos pedagógicos, além de fomentar hábitos saudáveis e o desenvolvimento integral dos alunos.',
      areas: [
        'Ensino Fundamental e Médio em Escolas Públicas e Privadas',
        'Coordenação e Orientação Pedagógica em Instituições Educacionais',
        'Programas de Educação Física Adaptada para Pessoas com Necessidades Especiais',
        'Elaboração e Implementação de Projetos de Atividades Físicas e Saúde',
        'Atuação em Espaços de Educação Não Formal como ONGs e Centros Comunitários',
        'Formação e Capacitação de Professores e Monitores de Educação Física',
        'Avaliação e Preservação da Saúde e do Bem-Estar na Escola'
      ],
      minSalary: 2200,
      maxSalary: 6500,
      competencies: [
        'Planejamento e desenvolvimento de aulas de Educação Física',
        'Conhecimento dos fundamentos pedagógicos e didáticos da Educação Física',
        'Capacidade de avaliação motora e desenvolvimento físico dos alunos',
        'Habilidade para adaptar atividades para diferentes públicos e necessidades',
        'Comunicação clara e eficaz com alunos, pais e equipe escolar',
        'Trabalho colaborativo e interdisciplinar com outros profissionais da educação',
        'Ética profissional e promoção da inclusão social por meio da atividade física'
      ],
      category: 'Saúde',
      duration: 8,
      degreeType: 'Licenciatura',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '100',
      title: 'Filosofia',
      description: 'O curso de Filosofia (Licenciatura) forma profissionais capacitados para ensinar filosofia em escolas de ensino fundamental e médio, além de desenvolver habilidades críticas e analíticas para atuar em pesquisa, consultoria e projetos culturais. O licenciado em Filosofia também está apto a promover o pensamento reflexivo e ético na educação e na sociedade.',
      areas: [
        'Ensino de Filosofia em escolas públicas e privadas',
        'Pesquisa acadêmica em filosofia e áreas correlatas',
        'Consultoria educacional e pedagógica',
        'Produção e curadoria de conteúdo cultural e filosófico',
        'Atuação em ONGs e projetos sociais com foco em ética e cidadania',
        'Mediação de conflitos e orientação filosófica',
        'Desenvolvimento de material didático e literário'
      ],
      minSalary: 2200,
      maxSalary: 7000,
      competencies: [
        'Capacidade de planejamento e execução de aulas para diferentes públicos',
        'Domínio dos principais conceitos e correntes filosóficas',
        'Habilidade crítica e analítica para interpretar textos e contextos',
        'Comunicação clara e persuasiva, tanto oral quanto escrita',
        'Desenvolvimento do pensamento ético e reflexivo',
        'Capacidade de pesquisa e produção acadêmica',
        'Trabalho colaborativo e interdisciplinar'
      ],
      category: 'Ciências Humanas',
      duration: 8,
      degreeType: 'Licenciatura',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '101',
      title: 'Física',
      description: 'O curso de Física Licenciatura forma profissionais capacitados para atuar no ensino de Física em diferentes níveis da educação básica, além de desenvolver habilidades para promover a pesquisa e a divulgação científica. O licenciado adquire conhecimentos aprofundados em conceitos físicos, metodologias de ensino e tecnologias educacionais.',
      areas: [
        'Ensino em escolas públicas e privadas',
        'Elaboração de materiais didáticos e recursos pedagógicos',
        'Orientação e supervisão de atividades científicas e projetos educacionais',
        'Atuação em programas de extensão e divulgação científica',
        'Desenvolvimento de metodologias inovadoras para o ensino de Física',
        'Participação em programas de formação continuada de professores',
        'Consultoria educacional em instituições de ensino e órgãos públicos'
      ],
      minSalary: 2500,
      maxSalary: 7000,
      competencies: [
        'Domínio dos conteúdos fundamentais da Física',
        'Capacidade de planejar, ministrar e avaliar aulas',
        'Habilidade para utilizar tecnologias educacionais e recursos multimídia',
        'Desenvolvimento de práticas pedagógicas inclusivas e interativas',
        'Competência para elaborar e aplicar avaliações diagnósticas e formativas',
        'Capacidade de promover a pesquisa científica aplicada à educação',
        'Habilidades de comunicação e trabalho colaborativo'
      ],
      category: 'Ciências Exatas',
      duration: 8,
      degreeType: 'Licenciatura',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '102',
      title: 'Geografia',
      description: 'O curso de Geografia (Licenciatura) forma profissionais capacitados para atuar no ensino da Geografia na educação básica, além de desenvolver pesquisas e projetos relacionados ao espaço geográfico, meio ambiente e planejamento territorial. O profissional aprende sobre processos naturais e humanos, utilizando ferramentas cartográficas e tecnológicas para análise e interpretação do território.',
      areas: [
        'Ensino de Geografia na Educação Básica',
        'Educação Ambiental',
        'Geoprocessamento e Cartografia',
        'Planejamento Urbano e Regional',
        'Gestão de Recursos Naturais',
        'Pesquisa e Extensão Universitária',
        'Monitoramento e Análise Ambiental'
      ],
      minSalary: 2200,
      maxSalary: 7000,
      competencies: [
        'Domínio de técnicas didáticas para ensino de Geografia',
        'Análise crítica dos processos socioambientais',
        'Uso de softwares de geoprocessamento e cartografia digital',
        'Capacidade de planejamento e gestão de projetos educacionais e ambientais',
        'Habilidade para desenvolver pesquisas científicas na área geográfica',
        'Comunicação eficaz e trabalho colaborativo',
        'Sensibilidade para questões ambientais e sociais'
      ],
      category: 'Ciências Humanas',
      duration: 8,
      degreeType: 'Licenciatura',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '103',
      title: 'História',
      description: 'O curso de História (Licenciatura) prepara profissionais para atuar na docência em escolas de ensino fundamental e médio, além de formar pesquisadores e gestores culturais capacitados a interpretar, preservar e divulgar o patrimônio histórico e cultural. O profissional aprende a desenvolver metodologias de ensino, análise crítica de fontes históricas e promover a reflexão sobre processos sociais ao longo do tempo.',
      areas: [
        'Ensino Fundamental e Médio',
        'Pesquisa Histórica e Acadêmica',
        'Gestão e Preservação do Patrimônio Cultural',
        'Museologia e Arquivologia',
        'Produção de Conteúdo Educacional e Cultural',
        'Consultoria em Projetos Culturais e Educativos',
        'Mediação Cultural e Educação Patrimonial'
      ],
      minSalary: 2500,
      maxSalary: 7000,
      competencies: [
        'Desenvolvimento de planos e práticas pedagógicas para o ensino de História',
        'Análise crítica e interpretação de fontes históricas diversas',
        'Capacidade de comunicação clara e eficaz para diferentes públicos',
        'Planejamento e execução de pesquisas científicas na área de História',
        'Conhecimento sobre políticas culturais e educacionais brasileiras',
        'Habilidade para organizar e gerir projetos culturais e educacionais',
        'Domínio de tecnologias educacionais e recursos didáticos'
      ],
      category: 'Ciências Humanas',
      duration: 8,
      degreeType: 'Licenciatura',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '104',
      title: 'Letras - Libras',
      description: 'O curso de Letras - Libras (Licenciatura) forma profissionais capacitados para o ensino da Língua Brasileira de Sinais, além de promover a inclusão e acessibilidade comunicacional para pessoas surdas. O profissional atua na mediação linguística e na produção de materiais pedagógicos voltados à Libras, desenvolvendo competências para trabalhar em ambientes escolares e comunitários.',
      areas: [
        'Ensino de Libras em escolas públicas e privadas',
        'Tradução e interpretação de Libras-Português',
        'Elaboração de materiais didáticos bilíngues',
        'Consultoria em acessibilidade comunicacional',
        'Atuação em instituições para pessoas surdas',
        'Mediação linguística em ambientes hospitalares e jurídicos',
        'Pesquisa e desenvolvimento em linguística de sinais'
      ],
      minSalary: 1800,
      maxSalary: 7000,
      competencies: [
        'Domínio da Língua Brasileira de Sinais (Libras)',
        'Planejamento e execução de aulas bilíngues',
        'Tradução e interpretação simultânea e consecutiva',
        'Desenvolvimento de materiais pedagógicos acessíveis',
        'Compreensão das questões socioculturais da comunidade surda',
        'Habilidades de comunicação intercultural',
        'Capacidade de atuação em contextos inclusivos'
      ],
      category: 'Educação',
      duration: 8,
      degreeType: 'Licenciatura',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '105',
      title: 'Letras - Língua Portuguesa',
      description: 'O curso de Letras - Língua Portuguesa (Licenciatura) forma profissionais capacitados para atuar no ensino da língua portuguesa, literatura e linguística em escolas de ensino fundamental e médio. O egresso desenvolve habilidades para planejar, executar e avaliar atividades pedagógicas, além de promover a valorização da língua e cultura brasileiras.',
      areas: [
        'Ensino fundamental e médio',
        'Produção e revisão de textos',
        'Consultoria linguística',
        'Elaboração de material didático',
        'Assessoria educacional',
        'Pesquisa acadêmica em linguística e literatura',
        'Coordenação pedagógica'
      ],
      minSalary: 2000,
      maxSalary: 6000,
      competencies: [
        'Domínio da gramática normativa e descritiva da língua portuguesa',
        'Capacidade de planejamento e desenvolvimento de aulas',
        'Habilidade em análise e interpretação textual',
        'Competência para elaborar e aplicar avaliações educacionais',
        'Capacidade de adaptação a diferentes contextos escolares',
        'Comunicação clara e eficaz',
        'Pensamento crítico e reflexivo'
      ],
      category: 'Educação',
      duration: 8,
      degreeType: 'Licenciatura',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '106',
      title: 'Letras - Línguas Estrangeiras (Inglês, Espanhol, etc.)',
      description: 'O curso de Letras - Línguas Estrangeiras (Inglês, Espanhol, etc.) forma profissionais capacitados para o ensino, tradução, interpretação e análise crítica das línguas e culturas estudadas. O egresso desenvolve habilidades linguísticas, pedagógicas e culturais para atuar em contextos educacionais, empresariais e culturais.',
      areas: [
        'Ensino de língua estrangeira em escolas públicas e privadas',
        'Tradução e interpretação de textos e discursos',
        'Consultoria linguística para empresas e instituições',
        'Produção e revisão de materiais didáticos',
        'Assessoria cultural e intercâmbio',
        'Pesquisa linguística e literária',
        'Atuação em editoras e meios de comunicação'
      ],
      minSalary: 1800,
      maxSalary: 7000,
      competencies: [
        'Domínio avançado das línguas estrangeiras estudadas',
        'Planejamento e desenvolvimento de aulas para diferentes públicos',
        'Capacidade de tradução e interpretação em contextos diversos',
        'Análise crítica de textos literários e culturais',
        'Comunicação eficaz e habilidades interpessoais',
        'Uso de tecnologias aplicadas ao ensino de línguas',
        'Pesquisa e produção acadêmica'
      ],
      category: 'Educação',
      duration: 8,
      degreeType: 'Licenciatura',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '107',
      title: 'Matemática',
      description: 'O curso de Matemática (Licenciatura) forma profissionais capacitados para atuar no ensino da matemática em diferentes níveis educacionais, desde o ensino fundamental até o ensino médio. O formando desenvolve habilidades para planejar, aplicar e avaliar práticas pedagógicas que promovam a aprendizagem e o interesse pela matemática.',
      areas: [
        'Ensino Fundamental e Médio',
        'Educação a Distância',
        'Coordenação Pedagógica',
        'Elaboração de Material Didático',
        'Assessoria Educacional',
        'Tutoria em Cursos de Matemática',
        'Pesquisa em Educação Matemática'
      ],
      minSalary: 2500,
      maxSalary: 7000,
      competencies: [
        'Domínio dos conteúdos matemáticos fundamentais',
        'Planejamento e desenvolvimento de aulas',
        'Utilização de recursos tecnológicos no ensino',
        'Avaliação e acompanhamento da aprendizagem',
        'Comunicação clara e objetiva',
        'Capacidade de adaptação a diferentes realidades educacionais',
        'Trabalho colaborativo e desenvolvimento de projetos pedagógicos'
      ],
      category: 'Ciências Exatas',
      duration: 8,
      degreeType: 'Licenciatura',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '108',
      title: 'Música',
      description: 'O curso de Música (Licenciatura) forma profissionais capacitados para atuar no ensino da música em escolas e instituições culturais, desenvolvendo habilidades técnicas e pedagógicas para a formação musical de diferentes públicos. O licenciado também adquire conhecimentos em teoria, prática instrumental, canto, composição e história da música.',
      areas: [
        'Ensino de música em escolas públicas e privadas',
        'Coordenação e regência de corais e grupos musicais',
        'Produção e mediação cultural em instituições educacionais',
        'Desenvolvimento de projetos musicais comunitários',
        'Assessoria pedagógica para metodologias de ensino musical',
        'Atuação em oficinas e cursos livres de música',
        'Pesquisa e extensão em educação musical'
      ],
      minSalary: 1800,
      maxSalary: 6000,
      competencies: [
        'Domínio técnico de instrumentos musicais e canto',
        'Conhecimento aprofundado em teoria e história da música',
        'Planejamento e execução de aulas e projetos educativos',
        'Capacidade de adaptação a diferentes faixas etárias e níveis de aprendizagem',
        'Habilidades de comunicação e mediação cultural',
        'Criatividade na elaboração de materiais didáticos',
        'Trabalho colaborativo e gestão de grupos musicais'
      ],
      category: 'Comunicação e Artes',
      duration: 8,
      degreeType: 'Licenciatura',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '109',
      title: 'Química',
      description: 'O curso de Química Licenciatura forma profissionais capacitados para atuar no ensino de Química em escolas de ensino fundamental e médio, além de desenvolver habilidades para aplicar conhecimentos químicos em contextos educacionais. O licenciado também aprende a planejar, executar e avaliar atividades pedagógicas, promovendo o aprendizado crítico e investigativo dos alunos.',
      areas: [
        'Ensino de Química em escolas públicas e privadas',
        'Elaboração de materiais didáticos e recursos pedagógicos',
        'Coordenação e gestão pedagógica em instituições de ensino',
        'Educação ambiental e sustentabilidade',
        'Divulgação científica e educação não formal',
        'Pesquisa educacional em Química',
        'Formação continuada de professores'
      ],
      minSalary: 2500,
      maxSalary: 7000,
      competencies: [
        'Domínio dos conteúdos de Química em diferentes níveis de complexidade',
        'Planejamento e desenvolvimento de aulas e atividades didáticas',
        'Avaliação e acompanhamento do processo de aprendizagem dos alunos',
        'Capacidade de comunicação clara e eficaz para diferentes públicos',
        'Utilização de tecnologias educacionais e recursos experimentais',
        'Desenvolvimento do pensamento crítico e científico nos estudantes',
        'Trabalho colaborativo e interdisciplinar'
      ],
      category: 'Ciências Exatas',
      duration: 8,
      degreeType: 'Licenciatura',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '110',
      title: 'Teatro',
      description: 'O curso de Teatro (Licenciatura) forma profissionais capacitados para atuar no ensino da arte teatral em escolas e instituições culturais, além de desenvolver habilidades em criação, interpretação e produção teatral. O licenciado aprende técnicas de atuação, direção, dramaturgia, além de fundamentos pedagógicos para o ensino da arte cênica.',
      areas: [
        'Professor de Teatro na Educação Básica',
        'Dramaturgia e Criação de Roteiros',
        'Direção Teatral',
        'Atuação e Performance',
        'Produção e Gestão Cultural',
        'Teatro Educativo e Comunitário',
        'Consultoria e Mediação Cultural'
      ],
      minSalary: 1800,
      maxSalary: 6500,
      competencies: [
        'Domínio de técnicas de atuação e expressão corporal',
        'Capacidade de planejamento e aplicação de metodologias pedagógicas',
        'Conhecimento em história e teoria do teatro',
        'Habilidade em direção e produção teatral',
        'Criatividade para elaboração de projetos cênicos',
        'Comunicação eficaz e trabalho em equipe',
        'Capacidade de avaliação e mediação cultural'
      ],
      category: 'Comunicação e Artes',
      duration: 8,
      degreeType: 'Licenciatura',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '111',
      title: 'Banco de Dados',
      description: 'O curso de Banco de Dados (Tecnólogo) capacita profissionais para projetar, implementar e gerenciar sistemas de bancos de dados, garantindo a integridade, segurança e eficiência das informações. O egresso aprende a trabalhar com modelagem de dados, administração de bancos relacionais e não relacionais, além de otimização de consultas e análise de grandes volumes de dados.',
      areas: [
        'Administração de Banco de Dados (DBA)',
        'Modelagem e Projeto de Dados',
        'Data Warehouse e Business Intelligence',
        'Big Data e Análise de Dados',
        'Segurança da Informação em Banco de Dados',
        'Suporte e Consultoria Técnica em Banco de Dados',
        'Desenvolvimento de Sistemas Integrados com Banco de Dados'
      ],
      minSalary: 2500,
      maxSalary: 8000,
      competencies: [
        'Modelagem e normalização de dados',
        'Administração e manutenção de bancos de dados',
        'Otimização e tuning de consultas SQL',
        'Implementação de políticas de segurança e backup',
        'Trabalho com bancos de dados relacionais e NoSQL',
        'Análise crítica e solução de problemas técnicos',
        'Comunicação eficaz e trabalho em equipe'
      ],
      category: 'Tecnologia',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '112',
      title: 'Ciência de Dados (Data Science)',
      description: 'O curso de Ciência de Dados (Tecnólogo) capacita profissionais para coletar, analisar e interpretar grandes volumes de dados, utilizando técnicas de estatística, programação e machine learning. O egresso estará apto a transformar dados em insights estratégicos para apoiar a tomada de decisão nas organizações.',
      areas: [
        'Análise de Dados em Finanças',
        'Business Intelligence e Analytics',
        'Data Science para Varejo e E-commerce',
        'Ciência de Dados em Saúde',
        'Big Data e Computação em Nuvem',
        'Modelagem Preditiva e Machine Learning',
        'Consultoria em Dados e Estratégia'
      ],
      minSalary: 3000,
      maxSalary: 9000,
      competencies: [
        'Programação em Python e R',
        'Manipulação e tratamento de dados',
        'Modelagem estatística e preditiva',
        'Visualização de dados e storytelling',
        'Conhecimento de bases de dados relacionais e NoSQL',
        'Capacidade analítica e pensamento crítico',
        'Trabalho em equipe e comunicação efetiva'
      ],
      category: 'Tecnologia',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '113',
      title: 'Defesa Cibernética',
      description: 'O curso de Defesa Cibernética forma profissionais capacitados a proteger sistemas, redes e dados contra ameaças digitais, aplicando técnicas de segurança da informação e análise forense. O tecnólogo aprende a identificar vulnerabilidades, implementar políticas de segurança e responder a incidentes cibernéticos, garantindo a integridade e confidencialidade das informações.',
      areas: [
        'Análise e resposta a incidentes de segurança',
        'Gestão de segurança da informação',
        'Monitoramento e defesa de redes corporativas',
        'Teste de invasão (pentest) e avaliação de vulnerabilidades',
        'Criptografia aplicada e proteção de dados',
        'Segurança em sistemas de controle industrial (ICS/SCADA)',
        'Análise forense digital'
      ],
      minSalary: 3000,
      maxSalary: 9000,
      competencies: [
        'Identificação e mitigação de ameaças cibernéticas',
        'Configuração e administração de ferramentas de segurança',
        'Planejamento e implementação de políticas de segurança',
        'Análise de logs e investigação de incidentes digitais',
        'Comunicação eficaz em situações de crise',
        'Trabalho em equipe multidisciplinar',
        'Atualização contínua frente a novas tecnologias e ameaças'
      ],
      category: 'Tecnologia',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '114',
      title: 'Gestão da Tecnologia da Informação',
      description: 'O curso de Gestão da Tecnologia da Informação forma profissionais capazes de planejar, implementar e gerenciar soluções tecnológicas alinhadas aos objetivos estratégicos das organizações. O graduado desenvolve habilidades para administrar recursos de TI, liderar equipes e otimizar processos por meio do uso eficiente da tecnologia.',
      areas: [
        'Gerenciamento de Projetos de TI',
        'Segurança da Informação',
        'Governança de TI',
        'Infraestrutura de Redes',
        'Suporte e Gestão de Serviços de TI',
        'Análise e Desenvolvimento de Sistemas',
        'Consultoria em Tecnologia da Informação'
      ],
      minSalary: 2500,
      maxSalary: 8500,
      competencies: [
        'Planejamento e gerenciamento de projetos de TI',
        'Implementação de políticas de segurança da informação',
        'Liderança e gestão de equipes multidisciplinares',
        'Análise crítica para tomada de decisões estratégicas',
        'Comunicação eficaz com áreas técnicas e de negócio',
        'Capacidade de adaptação a novas tecnologias',
        'Conhecimento em governança e compliance de TI'
      ],
      category: 'Tecnologia',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '115',
      title: 'Jogos Digitais',
      description: 'O curso de Jogos Digitais (Tecnólogo) forma profissionais capacitados para projetar, desenvolver e gerenciar jogos eletrônicos, aplicando técnicas de programação, design e narrativa interativa. O egresso atua na criação de experiências digitais imersivas para diversas plataformas, integrando conhecimentos técnicos e criativos.',
      areas: [
        'Desenvolvimento de jogos para dispositivos móveis',
        'Design e produção de jogos para consoles e PC',
        'Realidade virtual e aumentada aplicada a jogos',
        'Animação e arte digital para games',
        'Teste e garantia de qualidade de jogos',
        'Produção e gerenciamento de projetos de jogos digitais',
        'Análise de dados e monetização em jogos'
      ],
      minSalary: 2500,
      maxSalary: 9000,
      competencies: [
        'Programação em linguagens específicas para jogos (C#, Unity, Unreal Engine)',
        'Design de interfaces e experiência do usuário (UX/UI)',
        'Criação de narrativas interativas e storytelling',
        'Modelagem e animação 3D',
        'Trabalho em equipe multidisciplinar',
        'Gerenciamento de projetos ágeis',
        'Capacidade de resolução de problemas e pensamento crítico'
      ],
      category: 'Tecnologia',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '116',
      title: 'Redes de Computadores',
      description: 'O curso de Redes de Computadores forma profissionais capacitados a projetar, implementar, gerenciar e manter infraestruturas de redes de dados. O tecnólogo desenvolve competências em segurança da informação, administração de redes e suporte técnico, preparando-se para atuar em ambientes corporativos variados.',
      areas: [
        'Administração de Redes Corporativas',
        'Segurança da Informação e Cibersegurança',
        'Suporte Técnico e Help Desk',
        'Configuração e Gerenciamento de Servidores',
        'Telecomunicações e Redes de Comunicação',
        'Implementação de Redes Wireless',
        'Monitoramento e Análise de Tráfego de Rede'
      ],
      minSalary: 2500,
      maxSalary: 7000,
      competencies: [
        'Configuração de equipamentos de rede (switches, roteadores, firewalls)',
        'Administração de sistemas operacionais em rede (Windows Server, Linux)',
        'Implementação de políticas de segurança da informação',
        'Diagnóstico e resolução de problemas de rede',
        'Planejamento e projeto de redes locais e remotas',
        'Trabalho em equipe e comunicação técnica',
        'Atualização contínua em tecnologias de redes e protocolos'
      ],
      category: 'Tecnologia',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '117',
      title: 'Segurança da Informação',
      description: 'O curso de Segurança da Informação (Tecnólogo) forma profissionais capacitados a proteger sistemas, redes e dados contra ameaças digitais, garantindo a integridade, confidencialidade e disponibilidade das informações. O aluno aprende a identificar vulnerabilidades, implementar políticas de segurança e utilizar ferramentas tecnológicas para mitigação de riscos.',
      areas: [
        'Gestão de Segurança da Informação',
        'Análise e Resposta a Incidentes',
        'Auditoria e Conformidade em Segurança da Informação',
        'Criptografia e Proteção de Dados',
        'Segurança em Redes e Sistemas',
        'Governança de TI e Gestão de Riscos',
        'Forense Digital'
      ],
      minSalary: 2500,
      maxSalary: 8500,
      competencies: [
        'Analisar e implementar políticas de segurança da informação',
        'Monitorar e responder a incidentes de segurança',
        'Utilizar ferramentas de criptografia e controle de acesso',
        'Realizar auditorias e avaliações de vulnerabilidades',
        'Gerenciar riscos associados à segurança da informação',
        'Comunicar-se de forma clara com equipes técnicas e não técnicas',
        'Atualizar-se continuamente diante das novas ameaças e tecnologias'
      ],
      category: 'Tecnologia',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '118',
      title: 'Sistemas para Internet',
      description: 'O curso de Sistemas para Internet forma profissionais capacitados a desenvolver, implementar e gerenciar aplicações e serviços para ambientes web, utilizando tecnologias atuais. O profissional aprende a projetar sistemas, integrar soluções e garantir a usabilidade e segurança de plataformas digitais.',
      areas: [
        'Desenvolvimento de Aplicações Web',
        'Design e Usabilidade de Interfaces',
        'Administração de Banco de Dados',
        'Segurança da Informação',
        'E-commerce e Sistemas de Pagamento Online',
        'Gerenciamento de Projetos de Software',
        'Suporte e Manutenção de Sistemas Web'
      ],
      minSalary: 1800,
      maxSalary: 6500,
      competencies: [
        'Programação front-end e back-end',
        'Modelagem e gerenciamento de bancos de dados',
        'Conhecimento em linguagens e frameworks web',
        'Análise e resolução de problemas técnicos',
        'Trabalho em equipe multidisciplinar',
        'Gestão de projetos ágeis',
        'Comunicação eficaz com usuários e clientes'
      ],
      category: 'Tecnologia',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '119',
      title: 'Comércio Exterior',
      description: 'O curso de Comércio Exterior (Tecnólogo) capacita profissionais para atuar na gestão e operacionalização de processos de importação e exportação, analisando mercados internacionais e promovendo o comércio global. O aluno aprende sobre logística, legislação aduaneira, negociação internacional e estratégias comerciais para empresas que atuam no mercado externo.',
      areas: [
        'Agenciamento e despacho aduaneiro',
        'Logística internacional',
        'Análise e pesquisa de mercados externos',
        'Gestão de operações de importação e exportação',
        'Consultoria em comércio exterior',
        'Negociação internacional',
        'Compliance e legislação aduaneira'
      ],
      minSalary: 2200,
      maxSalary: 7000,
      competencies: [
        'Conhecimento em regulamentações e procedimentos aduaneiros',
        'Habilidade em negociação internacional',
        'Capacidade de gestão logística e cadeia de suprimentos',
        'Análise de mercados e riscos comerciais',
        'Domínio de idiomas estrangeiros aplicados ao comércio exterior',
        'Comunicação eficaz e trabalho em equipe',
        'Uso de sistemas e tecnologias para comércio exterior'
      ],
      category: 'Gestão e Negócios',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '120',
      title: 'Gestão Comercial',
      description: 'O curso de Gestão Comercial forma profissionais capacitados para planejar, coordenar e executar estratégias comerciais que impulsionam a competitividade das empresas. O profissional aprende a analisar mercados, gerir equipes de vendas e desenvolver políticas de relacionamento com clientes, visando maximizar resultados financeiros.',
      areas: [
        'Gestão de Vendas',
        'Marketing e Pesquisa de Mercado',
        'Comércio Exterior',
        'Gestão de Relacionamento com Clientes (CRM)',
        'Logística Comercial',
        'Negociação Empresarial',
        'Gestão de Produtos e Serviços'
      ],
      minSalary: 1800,
      maxSalary: 5500,
      competencies: [
        'Planejamento estratégico de vendas',
        'Análise de mercado e comportamento do consumidor',
        'Gestão de equipes e liderança',
        'Negociação e fechamento de contratos',
        'Elaboração de planos comerciais e campanhas de marketing',
        'Uso de ferramentas tecnológicas para CRM',
        'Comunicação eficaz e tomada de decisão'
      ],
      category: 'Gestão e Negócios',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '121',
      title: 'Gestão da Qualidade',
      description: 'O curso de Gestão da Qualidade forma profissionais capacitados para planejar, implementar e controlar sistemas de gestão da qualidade em organizações de diversos setores. O tecnólogo desenvolve habilidades para analisar processos, garantir conformidade com normas técnicas e promover a melhoria contínua visando a satisfação do cliente.',
      areas: [
        'Gestão da Qualidade em Indústrias',
        'Auditoria e Controle de Qualidade',
        'Certificação e Normas ISO',
        'Gestão de Processos e Melhoria Contínua',
        'Consultoria em Qualidade',
        'Gestão da Qualidade em Serviços',
        'Análise e Controle Estatístico de Processos'
      ],
      minSalary: 1800,
      maxSalary: 6500,
      competencies: [
        'Conhecimento em normas ISO (9001, 14001, 45001)',
        'Capacidade de realizar auditorias internas',
        'Análise estatística e controle de processos',
        'Planejamento e implementação de sistemas de gestão',
        'Comunicação eficaz e trabalho em equipe',
        'Tomada de decisão baseada em dados',
        'Foco em melhoria contínua e inovação'
      ],
      category: 'Gestão e Negócios',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '122',
      title: 'Gestão de Cooperativas',
      description: 'O curso de Gestão de Cooperativas forma profissionais capacitados para planejar, organizar e administrar cooperativas, promovendo o desenvolvimento sustentável e a participação democrática dos associados. O egresso desenvolve conhecimentos em gestão administrativa, financeira, mercadológica e legal aplicados ao setor cooperativista.',
      areas: [
        'Gestão administrativa de cooperativas',
        'Planejamento estratégico cooperativo',
        'Gestão financeira e contábil de cooperativas',
        'Desenvolvimento de produtos e serviços cooperativos',
        'Consultoria e assessoria para cooperativas',
        'Gestão de pessoas e liderança participativa',
        'Marketing cooperativo e relacionamento com associados'
      ],
      minSalary: 2500,
      maxSalary: 7000,
      competencies: [
        'Capacidade de elaborar e implementar planos de gestão cooperativa',
        'Conhecimento aprofundado da legislação cooperativista brasileira',
        'Habilidade em gerir recursos financeiros e contábeis específicos de cooperativas',
        'Competência para promover a participação democrática e a comunicação interna',
        'Capacidade de liderança e trabalho em equipe em ambientes cooperativos',
        'Habilidade na análise de mercado e desenvolvimento de produtos cooperativos',
        'Capacidade de resolução de conflitos e tomada de decisão ética'
      ],
      category: 'Gestão e Negócios',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '123',
      title: 'Gestão de Recursos Humanos',
      description: 'O curso de Gestão de Recursos Humanos forma profissionais capacitados para planejar, executar e avaliar estratégias relacionadas à gestão de pessoas nas organizações. O tecnólogo desenvolve habilidades em recrutamento, seleção, treinamento, desenvolvimento, administração de benefícios e relações trabalhistas.',
      areas: [
        'Recrutamento e Seleção',
        'Treinamento e Desenvolvimento',
        'Administração de Benefícios',
        'Gestão de Desempenho',
        'Relações Trabalhistas e Sindicais',
        'Consultoria em Recursos Humanos',
        'Gestão de Clima Organizacional'
      ],
      minSalary: 1800,
      maxSalary: 6000,
      competencies: [
        'Planejamento e execução de processos seletivos',
        'Desenvolvimento de programas de capacitação',
        'Análise e aplicação da legislação trabalhista',
        'Gestão de conflitos e mediação',
        'Comunicação eficaz e liderança',
        'Capacidade de análise e tomada de decisão',
        'Uso de sistemas de informação em RH'
      ],
      category: 'Gestão e Negócios',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '124',
      title: 'Gestão Financeira',
      description: 'O curso de Gestão Financeira forma profissionais capacitados para planejar, organizar e controlar recursos financeiros em diferentes tipos de organizações, visando a sustentabilidade econômica. O tecnólogo desenvolve habilidades para análise de investimentos, gestão de riscos, elaboração de orçamentos e controle de custos.',
      areas: [
        'Análise Financeira e Investimentos',
        'Controle e Auditoria Financeira',
        'Planejamento Orçamentário',
        'Gestão de Riscos Financeiros',
        'Tesouraria e Fluxo de Caixa',
        'Consultoria Financeira',
        'Mercado de Capitais'
      ],
      minSalary: 1800,
      maxSalary: 6500,
      competencies: [
        'Análise e interpretação de demonstrações financeiras',
        'Elaboração e controle de orçamentos',
        'Gestão de fluxo de caixa e capital de giro',
        'Avaliação de riscos e tomada de decisão financeira',
        'Uso de softwares financeiros e ERP',
        'Comunicação efetiva e negociação',
        'Planejamento estratégico financeiro'
      ],
      category: 'Gestão e Negócios',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '125',
      title: 'Gestão Pública',
      description: 'O curso de Gestão Pública forma profissionais capacitados para planejar, implementar e avaliar políticas públicas, além de gerir recursos e processos administrativos em órgãos governamentais. O tecnólogo desenvolve conhecimentos em administração pública, legislação, orçamento público e controle social, visando a eficiência e transparência na gestão pública.',
      areas: [
        'Administração de órgãos governamentais municipais, estaduais e federais',
        'Planejamento e orçamento público',
        'Controle e auditoria de contas públicas',
        'Gestão de políticas sociais e programas governamentais',
        'Consultoria em gestão pública e governança',
        'Organizações não governamentais e terceiro setor',
        'Agências reguladoras e autarquias'
      ],
      minSalary: 2200,
      maxSalary: 8500,
      competencies: [
        'Elaboração e gestão de planos e projetos públicos',
        'Análise e interpretação da legislação aplicável à administração pública',
        'Gerenciamento de recursos financeiros e humanos no setor público',
        'Capacidade de comunicação e negociação com diferentes stakeholders',
        'Uso de tecnologias da informação para gestão e transparência',
        'Desenvolvimento de estratégias para eficiência e inovação pública',
        'Ética e responsabilidade social na administração pública'
      ],
      category: 'Gestão e Negócios',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '126',
      title: 'Logística',
      description: 'O curso de Logística (Tecnólogo) forma profissionais capacitados para planejar, implementar e controlar processos de cadeia de suprimentos, transporte, armazenagem e distribuição de produtos. O egresso desenvolve habilidades para otimizar recursos, reduzir custos e garantir a eficiência operacional nas organizações.',
      areas: [
        'Gestão de Cadeia de Suprimentos',
        'Transporte e Distribuição',
        'Armazenagem e Controle de Estoques',
        'Planejamento Logístico',
        'Logística Reversa',
        'Compras e Suprimentos',
        'Logística Internacional'
      ],
      minSalary: 1800,
      maxSalary: 6000,
      competencies: [
        'Análise e otimização de processos logísticos',
        'Gestão de estoques e armazenagem',
        'Planejamento de rotas e transporte',
        'Conhecimento em sistemas de logística (ERP, WMS, TMS)',
        'Capacidade de negociação com fornecedores e clientes',
        'Tomada de decisão baseada em indicadores de desempenho',
        'Habilidades de comunicação e trabalho em equipe'
      ],
      category: 'Gestão e Negócios',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '127',
      title: 'Processos Gerenciais',
      description: 'O curso de Processos Gerenciais forma profissionais capacitados para planejar, organizar, dirigir e controlar processos administrativos em empresas de diversos setores. O egresso desenvolve habilidades para otimizar recursos, liderar equipes e implementar estratégias que aumentem a eficiência operacional e a competitividade organizacional.',
      areas: [
        'Gestão de Recursos Humanos',
        'Gestão Financeira',
        'Gestão de Produção e Operações',
        'Gestão Comercial e Vendas',
        'Planejamento Estratégico',
        'Logística e Cadeia de Suprimentos',
        'Análise e Melhoria de Processos'
      ],
      minSalary: 1800,
      maxSalary: 5500,
      competencies: [
        'Planejamento e controle de processos administrativos',
        'Liderança e gestão de equipes',
        'Análise financeira e orçamentária',
        'Tomada de decisão baseada em dados',
        'Comunicação eficaz e negociação',
        'Capacidade de adaptação e resolução de problemas',
        'Domínio de ferramentas digitais e sistemas de gestão'
      ],
      category: 'Gestão e Negócios',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '128',
      title: 'Secretariado',
      description: 'O curso de Secretariado Tecnólogo forma profissionais capacitados para gerenciar atividades administrativas, assessorando gestores e coordenando processos organizacionais. O aluno desenvolve competências em comunicação, organização de eventos, gestão documental e uso de tecnologias aplicadas ao ambiente corporativo.',
      areas: [
        'Secretariado executivo',
        'Assessoria administrativa',
        'Organização de eventos corporativos',
        'Gestão de documentos e arquivos',
        'Comunicação empresarial',
        'Atendimento ao cliente e relacionamento interpessoal',
        'Gestão de processos administrativos'
      ],
      minSalary: 1800,
      maxSalary: 4500,
      competencies: [
        'Domínio de técnicas de comunicação oral e escrita',
        'Organização e planejamento de agendas e reuniões',
        'Gestão eficiente de documentos e informações',
        'Uso de ferramentas tecnológicas para escritório',
        'Capacidade de atendimento e relacionamento interpessoal',
        'Habilidades em organização de eventos',
        'Trabalho em equipe e resolução de problemas'
      ],
      category: 'Gestão e Negócios',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '129',
      title: 'Estética e Cosmética',
      description: 'O curso de Estética e Cosmética (Tecnólogo) forma profissionais capacitados para atuar no desenvolvimento, aplicação e gestão de procedimentos estéticos e tratamentos cosméticos, visando a promoção da saúde, beleza e bem-estar. O aluno aprende técnicas avançadas em cuidado da pele, uso de cosméticos, tecnologias estéticas e gestão de serviços na área.',
      areas: [
        'Clínicas de estética facial e corporal',
        'Spas e centros de bem-estar',
        'Indústria cosmética (desenvolvimento e controle de qualidade)',
        'Consultoria em beleza e cuidados pessoais',
        'Gestão de serviços e negócios estéticos',
        'Atendimento e prescrição de tratamentos estéticos',
        'Educação e treinamento em estética e cosmética'
      ],
      minSalary: 1800,
      maxSalary: 4500,
      competencies: [
        'Realização de procedimentos estéticos faciais e corporais',
        'Avaliação e diagnóstico da pele',
        'Conhecimento em cosmetologia e formulação de produtos',
        'Gestão de serviços e atendimento ao cliente',
        'Controle de qualidade em processos estéticos',
        'Capacidade de trabalhar com ética e empatia',
        'Atualização contínua sobre tecnologias e tendências do setor'
      ],
      category: 'Saúde',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '130',
      title: 'Gerontologia',
      description: 'O curso de Gerontologia Tecnólogo capacita profissionais para atuar no planejamento, gestão e execução de políticas, programas e serviços voltados ao envelhecimento populacional. O egresso desenvolve conhecimentos multidisciplinares sobre aspectos biológicos, sociais e psicológicos do envelhecimento, promovendo a qualidade de vida da pessoa idosa.',
      areas: [
        'Gestão de serviços para a terceira idade',
        'Assessoria em políticas públicas de envelhecimento',
        'Atendimento e suporte domiciliar a idosos',
        'Orientação e consultoria em instituições de longa permanência',
        'Planejamento de atividades socioeducativas para idosos',
        'Prevenção e promoção da saúde do idoso',
        'Pesquisa aplicada em envelhecimento'
      ],
      minSalary: 1800,
      maxSalary: 5500,
      competencies: [
        'Elaboração e gestão de projetos voltados ao público idoso',
        'Conhecimento das políticas públicas e direitos da pessoa idosa',
        'Habilidade em comunicação e empatia para atendimento humanizado',
        'Capacidade de análise crítica das necessidades do envelhecimento',
        'Planejamento e execução de atividades de promoção da saúde',
        'Trabalho interdisciplinar e em equipe',
        'Uso de tecnologias assistivas e recursos adaptativos'
      ],
      category: 'Saúde',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '131',
      title: 'Gestão Ambiental',
      description: 'O curso de Gestão Ambiental (Tecnólogo) capacita profissionais para planejar, implementar e gerenciar práticas sustentáveis que minimizem os impactos ambientais em empresas e organizações. O egresso atua na análise e controle de recursos naturais, promovendo o desenvolvimento sustentável aliado à viabilidade econômica.',
      areas: [
        'Gestão de resíduos sólidos',
        'Licenciamento ambiental',
        'Monitoramento de recursos naturais',
        'Consultoria ambiental empresarial',
        'Educação ambiental',
        'Auditoria ambiental',
        'Planejamento e gestão de áreas protegidas'
      ],
      minSalary: 1800,
      maxSalary: 4500,
      competencies: [
        'Análise e interpretação da legislação ambiental brasileira',
        'Desenvolvimento de programas de controle ambiental',
        'Uso de ferramentas para avaliação de impacto ambiental',
        'Capacidade de comunicação e sensibilização ambiental',
        'Gestão de recursos naturais e energéticos',
        'Tomada de decisão baseada em sustentabilidade',
        'Trabalho em equipe multidisciplinar'
      ],
      category: 'Meio Ambiente',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '132',
      title: 'Podologia',
      description: 'O curso de Podologia Tecnólogo capacita o profissional para realizar a prevenção, diagnóstico e tratamento de enfermidades dos pés, promovendo a saúde podal e o bem-estar dos pacientes. O aluno aprende técnicas de cuidados dermato-podológicos, biomecânica dos pés e atendimento clínico especializado.',
      areas: [
        'Clínicas de podologia',
        'Centros de saúde e hospitais',
        'Instituições geriátricas',
        'Atendimento domiciliar',
        'Centros de reabilitação e ortopedia',
        'Estabelecimentos de estética e beleza',
        'Programas de prevenção em saúde pública'
      ],
      minSalary: 1500,
      maxSalary: 4500,
      competencies: [
        'Realização de avaliação e diagnóstico podológico',
        'Execução de tratamentos dermato-podológicos',
        'Aplicação de técnicas de cuidado e higiene dos pés',
        'Orientação em prevenção de doenças podais',
        'Atendimento humanizado e ético ao paciente',
        'Trabalho em equipe multiprofissional de saúde',
        'Gestão básica de serviços e biossegurança'
      ],
      category: 'Saúde',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '133',
      title: 'Radiologia',
      description: 'O curso de Radiologia (Tecnólogo) forma profissionais capacitados para operar equipamentos de diagnóstico por imagem, realizar exames radiológicos e garantir a qualidade e segurança dos procedimentos. O tecnólogo aprende técnicas de obtenção, processamento e interpretação preliminar de imagens, além de normas de biossegurança e atendimento ao paciente.',
      areas: [
        'Radiologia Hospitalar',
        'Radiologia Odontológica',
        'Radiologia Industrial',
        'Medicina Nuclear',
        'Radioterapia',
        'Diagnóstico por Imagem em Clínicas e Laboratórios',
        'Controle de Qualidade em Equipamentos Radiológicos'
      ],
      minSalary: 1800,
      maxSalary: 5500,
      competencies: [
        'Operação de equipamentos radiológicos e de diagnóstico por imagem',
        'Aplicação de normas de biossegurança e proteção radiológica',
        'Realização e processamento de exames radiológicos',
        'Atendimento humanizado ao paciente',
        'Interpretação preliminar de imagens radiográficas',
        'Manutenção preventiva e controle de qualidade dos equipamentos',
        'Trabalho em equipe multidisciplinar'
      ],
      category: 'Saúde',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '134',
      title: 'Saneamento Ambiental',
      description: 'O curso de Saneamento Ambiental (Tecnólogo) forma profissionais capacitados para planejar, executar e gerenciar sistemas de abastecimento de água, coleta e tratamento de esgoto, além de promover a gestão ambiental integrada. O profissional atua na melhoria da qualidade de vida da população por meio do controle e preservação dos recursos hídricos e do ambiente urbano.',
      areas: [
        'Gestão de sistemas de abastecimento de água',
        'Tratamento e disposição de resíduos sólidos',
        'Coleta e tratamento de esgoto sanitário',
        'Monitoramento e controle da qualidade ambiental',
        'Planejamento e operação de estações de tratamento',
        'Consultoria ambiental para saneamento',
        'Fiscalização e regulamentação ambiental'
      ],
      minSalary: 2500,
      maxSalary: 6500,
      competencies: [
        'Análise e interpretação de parâmetros físico-químicos e microbiológicos da água',
        'Projeto e operação de sistemas de saneamento básico',
        'Gestão ambiental e sustentabilidade',
        'Uso de tecnologias para tratamento de água e esgoto',
        'Capacidade de trabalhar em equipe multidisciplinar',
        'Comunicação técnica e elaboração de relatórios',
        'Conhecimento das normas e legislações ambientais brasileiras'
      ],
      category: 'Meio Ambiente',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '135',
      title: 'Comunicação Institucional',
      description: 'O curso de Comunicação Institucional forma profissionais capacitados para planejar, executar e gerenciar estratégias de comunicação interna e externa em organizações públicas e privadas. O tecnólogo desenvolve habilidades para fortalecer a imagem institucional, promover o engajamento de públicos e apoiar a tomada de decisão por meio de comunicação eficaz.',
      areas: [
        'Assessoria de Comunicação',
        'Comunicação Interna',
        'Relações Públicas',
        'Gestão de Crises',
        'Produção de Conteúdo Institucional',
        'Marketing Institucional',
        'Responsabilidade Social e Comunicação'
      ],
      minSalary: 1800,
      maxSalary: 5500,
      competencies: [
        'Elaboração de planos de comunicação integrada',
        'Produção e edição de materiais institucionais',
        'Gestão de canais de comunicação corporativa',
        'Coordenação de eventos e campanhas internas',
        'Análise de público e mensuração de resultados',
        'Capacidade de trabalhar em equipe multidisciplinar',
        'Habilidades de negociação e mediação de conflitos'
      ],
      category: 'Comunicação e Artes',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '136',
      title: 'Conservação e Restauro',
      description: 'O curso de Conservação e Restauro (Tecnólogo) forma profissionais capacitados para identificar, analisar e intervir em bens culturais, garantindo sua preservação e integridade. O estudante aprende técnicas de restauro, conservação preventiva e manejo de materiais artísticos e históricos, atuando em diferentes contextos culturais e museológicos.',
      areas: [
        'Conservação e restauro de obras de arte em museus',
        'Preservação de patrimônios históricos e arquitetônicos',
        'Conservação de documentos e acervos bibliográficos',
        'Restauro de peças arqueológicas',
        'Consultoria em conservação preventiva para instituições culturais',
        'Atuação em laboratórios de análise e diagnóstico de materiais',
        'Gestão de projetos de conservação em órgãos públicos e privados'
      ],
      minSalary: 2200,
      maxSalary: 5500,
      competencies: [
        'Análise técnica e diagnóstico de materiais artísticos',
        'Aplicação de técnicas de conservação e restauro',
        'Conhecimento em química aplicada à conservação',
        'Capacidade de planejamento e execução de projetos de preservação',
        'Habilidade para trabalhar com diferentes materiais e suportes',
        'Comunicação eficaz com equipes multidisciplinares',
        'Ética e responsabilidade social na preservação do patrimônio cultural'
      ],
      category: 'Comunicação e Artes',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '137',
      title: 'Design de Interiores',
      description: 'O curso de Design de Interiores (Tecnólogo) forma profissionais capacitados a planejar, projetar e executar ambientes internos, considerando aspectos estéticos, funcionais e sustentáveis. O aluno aprende a utilizar ferramentas de desenho técnico e digital, além de entender normas técnicas e tendências de mercado para criar soluções inovadoras e personalizadas.',
      areas: [
        'Residencial',
        'Comercial',
        'Corporativo',
        'Hospitalar',
        'Hospitalidade e turismo',
        'Exposições e eventos',
        'Design sustentável e ambientação ecológica'
      ],
      minSalary: 1800,
      maxSalary: 6500,
      competencies: [
        'Leitura e interpretação de plantas e projetos arquitetônicos',
        'Domínio de softwares de modelagem 3D e renderização',
        'Conhecimento em materiais, iluminação e ergonomia',
        'Capacidade de planejamento e gestão de projetos',
        'Criatividade e inovação no desenvolvimento de ambientes',
        'Comunicação eficaz com clientes e equipes multidisciplinares',
        'Adequação de projetos às normas técnicas e de segurança'
      ],
      category: 'Comunicação e Artes',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '138',
      title: 'Design de Moda',
      description: 'O curso de Design de Moda (Tecnólogo) capacita profissionais para criar, desenvolver e gerenciar produtos e coleções de moda, alinhando tendências, estética e funcionalidade. O aluno aprende técnicas de desenho, modelagem, produção têxtil, além de aspectos comerciais e de marketing do setor fashion.',
      areas: [
        'Desenvolvimento de coleções de moda',
        'Consultoria de estilo e imagem',
        'Gestão de produção têxtil',
        'Visual merchandising e vitrinismo',
        'Marketing e comunicação de moda',
        'Design de acessórios e complementos',
        'Sustentabilidade e moda ética'
      ],
      minSalary: 1800,
      maxSalary: 6000,
      competencies: [
        'Domínio de ferramentas de desenho e modelagem digital',
        'Conhecimento de materiais, tecidos e processos produtivos',
        'Capacidade de análise de tendências e comportamento de consumo',
        'Habilidade em planejamento e gestão de projetos de moda',
        'Criatividade e inovação no desenvolvimento de produtos',
        'Comunicação eficaz para apresentação de coleções',
        'Sensibilidade para sustentabilidade e responsabilidade social'
      ],
      category: 'Comunicação e Artes',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '139',
      title: 'Design de Produto',
      description: 'O curso de Design de Produto (Tecnólogo) forma profissionais capacitados a desenvolver soluções inovadoras para produtos industriais, combinando estética, funcionalidade e viabilidade técnica. O aluno aprende a projetar, prototipar e avaliar produtos, considerando aspectos de sustentabilidade, ergonomia e mercado.',
      areas: [
        'Design de produtos industriais',
        'Desenvolvimento de embalagens',
        'Design de mobiliário',
        'Design automotivo',
        'Projeto de equipamentos eletrônicos',
        'Consultoria em design e inovação',
        'Gestão de projetos de design'
      ],
      minSalary: 2000,
      maxSalary: 7000,
      competencies: [
        'Domínio de softwares de modelagem 3D e prototipagem',
        'Capacidade de pesquisa e análise de mercado',
        'Conhecimento em materiais e processos produtivos',
        'Criatividade e inovação aplicada ao desenvolvimento de produtos',
        'Habilidades de comunicação e trabalho em equipe',
        'Gestão de projetos e prazos',
        'Consciência socioambiental na criação de produtos'
      ],
      category: 'Comunicação e Artes',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '140',
      title: 'Design Gráfico',
      description: 'O curso de Design Gráfico (Tecnólogo) capacita profissionais para criar soluções visuais eficientes, desenvolvendo identidade visual, comunicação digital e impressa. O aluno aprende a utilizar ferramentas e técnicas de design para atender às demandas do mercado e da comunicação corporativa.',
      areas: [
        'Agências de publicidade e propaganda',
        'Estúdios de design e comunicação visual',
        'Produção editorial e gráfica',
        'Design para mídias digitais e redes sociais',
        'Empresas de branding e identidade visual',
        'Setor de comunicação corporativa',
        'Freelancer e empreendedorismo em design'
      ],
      minSalary: 1800,
      maxSalary: 6000,
      competencies: [
        'Domínio de softwares gráficos (Adobe Photoshop, Illustrator, InDesign)',
        'Criação de layouts e identidade visual',
        'Capacidade de comunicação visual e escrita',
        'Gestão de projetos de design',
        'Criatividade e inovação',
        'Trabalho em equipe e comunicação interpessoal',
        'Adequação de projetos às necessidades do cliente'
      ],
      category: 'Comunicação e Artes',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '141',
      title: 'Fotografia',
      description: 'O curso de Fotografia (Tecnólogo) capacita profissionais para atuar na criação, produção e edição de imagens fotográficas em diversos segmentos. O aluno aprende técnicas de captura, tratamento digital, iluminação, composição e gestão de projetos fotográficos.',
      areas: [
        'Fotografia publicitária',
        'Fotografia documental e jornalística',
        'Fotografia de moda',
        'Fotografia artística',
        'Fotografia corporativa e eventos',
        'Edição e tratamento de imagens digitais',
        'Fotografia para mídias digitais e redes sociais'
      ],
      minSalary: 1500,
      maxSalary: 4500,
      competencies: [
        'Domínio de técnicas de captura fotográfica e uso de equipamentos',
        'Edição e pós-produção de imagens com softwares especializados',
        'Composição visual e linguagem estética aplicada à fotografia',
        'Planejamento e execução de projetos fotográficos',
        'Capacidade de trabalhar com diferentes estilos e demandas do mercado',
        'Comunicação eficaz e trabalho em equipe',
        'Gestão básica de direitos autorais e aspectos legais da fotografia'
      ],
      category: 'Comunicação e Artes',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '142',
      title: 'Produção Audiovisual',
      description: 'O curso de Produção Audiovisual forma profissionais capacitados para planejar, produzir e editar conteúdos audiovisuais em diferentes formatos e plataformas. O tecnólogo desenvolve habilidades técnicas e criativas para atuar em processos de pré-produção, filmagem, edição e pós-produção, com foco em narrativas visuais e sonoras.',
      areas: [
        'Produção de vídeos para televisão e internet',
        'Edição e pós-produção audiovisual',
        'Direção de fotografia e operação de câmeras',
        'Roteirização e criação de conteúdo audiovisual',
        'Produção de publicidade e marketing digital',
        'Animação e efeitos visuais',
        'Gestão de projetos audiovisuais'
      ],
      minSalary: 1800,
      maxSalary: 6500,
      competencies: [
        'Domínio de técnicas de captação e edição de vídeo',
        'Conhecimento em softwares de edição e montagem (Adobe Premiere, Final Cut, DaVinci Resolve)',
        'Capacidade de planejamento e organização de projetos audiovisuais',
        'Habilidade em comunicação e trabalho em equipe',
        'Criatividade para desenvolvimento de narrativas visuais',
        'Noções de iluminação e captação de áudio',
        'Adaptabilidade às novas tecnologias e tendências do mercado audiovisual'
      ],
      category: 'Comunicação e Artes',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '143',
      title: 'Produção Cultural',
      description: 'O curso de Produção Cultural (Tecnólogo) capacita profissionais para planejar, organizar e gerenciar projetos culturais, eventos e produções artísticas, integrando conhecimentos de gestão, comunicação e legislação cultural. O egresso atua na promoção e valorização da cultura, desenvolvendo estratégias para o desenvolvimento sustentável do setor cultural.',
      areas: [
        'Gestão de eventos culturais',
        'Produção de festivais e shows',
        'Curadoria e mediação cultural',
        'Gestão de espaços culturais',
        'Produção audiovisual e multimídia',
        'Elaboração e captação de projetos culturais',
        'Marketing cultural e comunicação'
      ],
      minSalary: 1800,
      maxSalary: 5500,
      competencies: [
        'Planejamento e organização de eventos culturais',
        'Elaboração de projetos culturais com foco em captação de recursos',
        'Conhecimento da legislação e políticas públicas culturais',
        'Gestão financeira e administrativa aplicada à cultura',
        'Comunicação e negociação com artistas, patrocinadores e público',
        'Uso de ferramentas digitais para divulgação e produção',
        'Trabalho em equipe e liderança em ambientes culturais'
      ],
      category: 'Comunicação e Artes',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '144',
      title: 'Produção Fonográfica',
      description: 'O curso de Produção Fonográfica forma profissionais capacitados para planejar, produzir e gerenciar projetos musicais e fonográficos, combinando conhecimentos técnicos de gravação, edição e mixagem com estratégias de mercado. O egresso atua na criação, captação e finalização de produtos musicais, além de desenvolver habilidades em gestão de direitos autorais e distribuição digital.',
      areas: [
        'Produção musical em estúdios de gravação',
        'Direção e engenharia de áudio',
        'Gestão de direitos autorais e licenciamento musical',
        'Distribuição digital e marketing fonográfico',
        'Edição, mixagem e masterização de áudio',
        'Curadoria e programação musical para mídias',
        'Produção de eventos musicais e shows'
      ],
      minSalary: 1800,
      maxSalary: 6000,
      competencies: [
        'Domínio de técnicas de captação e edição de áudio',
        'Conhecimento em softwares de produção musical (DAWs)',
        'Habilidade em gestão de projetos e equipes',
        'Conhecimento da legislação musical e direitos autorais',
        'Capacidade de análise crítica de produtos musicais',
        'Comunicação eficaz e trabalho em equipe',
        'Adaptabilidade às novas tecnologias do mercado fonográfico'
      ],
      category: 'Comunicação e Artes',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '145',
      title: 'Produção Publicitária',
      description: 'O curso de Produção Publicitária (Tecnólogo) capacita profissionais para planejar, criar e gerenciar campanhas publicitárias em diferentes mídias. O formando desenvolve habilidades em comunicação, marketing, criação e gestão de projetos publicitários, atuando de forma estratégica para promover marcas e produtos.',
      areas: [
        'Agências de publicidade e propaganda',
        'Marketing digital e mídias sociais',
        'Produção audiovisual para publicidade',
        'Planejamento e pesquisa de mercado',
        'Atendimento e relacionamento com clientes',
        'Gerenciamento de campanhas publicitárias',
        'Consultoria em comunicação e branding'
      ],
      minSalary: 1800,
      maxSalary: 6000,
      competencies: [
        'Criação e desenvolvimento de peças publicitárias',
        'Planejamento estratégico de comunicação',
        'Gestão de projetos e campanhas publicitárias',
        'Análise e interpretação de pesquisas de mercado',
        'Domínio de ferramentas de design e edição digital',
        'Comunicação eficaz e trabalho em equipe',
        'Capacidade de inovação e adaptação às tendências do mercado'
      ],
      category: 'Comunicação e Artes',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '146',
      title: 'Automação Industrial',
      description: 'O curso de Automação Industrial forma profissionais capacitados a projetar, implementar e gerenciar sistemas automatizados em processos produtivos, utilizando tecnologias como controle lógico programável, robótica e sensores. O tecnólogo desenvolve habilidades para otimizar a eficiência, a segurança e a qualidade nas indústrias, integrando conhecimentos de eletrônica, mecânica e informática.',
      areas: [
        'Manufatura automatizada',
        'Robótica industrial',
        'Sistemas de controle e instrumentação',
        'Manutenção preditiva e corretiva de equipamentos automatizados',
        'Automação de processos químicos e petroquímicos',
        'Indústria 4.0 e integração de sistemas ciber-físicos',
        'Programação e configuração de CLPs (Controladores Lógicos Programáveis)'
      ],
      minSalary: 2500,
      maxSalary: 7000,
      competencies: [
        'Projetar e implementar sistemas automatizados de controle',
        'Programar e configurar controladores lógicos programáveis (CLPs)',
        'Analisar e interpretar diagramas elétricos e de automação',
        'Realizar manutenção preventiva e corretiva em sistemas automatizados',
        'Aplicar conceitos de instrumentação e sensores industriais',
        'Trabalhar em equipe multidisciplinar com foco em processos industriais',
        'Gerenciar projetos e otimizar processos produtivos'
      ],
      category: 'Engenharia',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '147',
      title: 'Eletrônica Industrial',
      description: 'O curso de Eletrônica Industrial forma profissionais capacitados para projetar, implementar e manter sistemas eletrônicos aplicados à automação e controle industrial. O tecnólogo desenvolve habilidades em circuitos eletrônicos, sistemas de instrumentação e manutenção de equipamentos industriais, garantindo eficiência e segurança nos processos produtivos.',
      areas: [
        'Automação Industrial',
        'Manutenção de Equipamentos Eletrônicos',
        'Sistemas de Controle e Instrumentação',
        'Projetos de Circuitos Eletrônicos',
        'Indústria de Manufatura',
        'Energia e Sistemas Elétricos',
        'Suporte Técnico e Consultoria'
      ],
      minSalary: 1800,
      maxSalary: 5500,
      competencies: [
        'Leitura e interpretação de diagramas eletrônicos',
        'Programação de controladores lógicos programáveis (CLPs)',
        'Manutenção preventiva e corretiva de sistemas eletrônicos',
        'Análise e solução de problemas técnicos',
        'Trabalho em equipe e comunicação eficaz',
        'Conhecimento em normas técnicas e segurança industrial',
        'Capacidade de adaptação a novas tecnologias'
      ],
      category: 'Engenharia',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '148',
      title: 'Eletrotécnica Industrial',
      description: 'O curso de Eletrotécnica Industrial forma profissionais capacitados para projetar, instalar, operar e manter sistemas elétricos industriais, garantindo eficiência e segurança. O tecnólogo desenvolve habilidades para atuar em automação, controle e manutenção de equipamentos elétricos em ambientes industriais.',
      areas: [
        'Automação Industrial',
        'Manutenção de Sistemas Elétricos',
        'Projeto e Instalação de Sistemas Elétricos',
        'Controle de Processos Industriais',
        'Gestão de Energia Elétrica',
        'Instrumentação Industrial',
        'Segurança em Instalações Elétricas'
      ],
      minSalary: 2000,
      maxSalary: 7000,
      competencies: [
        'Análise e interpretação de diagramas elétricos',
        'Programação de controladores lógicos programáveis (CLPs)',
        'Diagnóstico e solução de problemas em sistemas elétricos',
        'Conhecimento em normas e segurança do trabalho',
        'Capacidade de trabalhar em equipe multidisciplinar',
        'Planejamento e execução de manutenção preventiva e corretiva',
        'Comunicação técnica eficaz'
      ],
      category: 'Engenharia',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '149',
      title: 'Gestão da Produção Industrial',
      description: 'O curso de Gestão da Produção Industrial forma profissionais capacitados para planejar, organizar, controlar e otimizar processos produtivos em indústrias, garantindo eficiência e qualidade. O tecnólogo desenvolve habilidades em gestão de recursos, análise de processos e melhoria contínua, atuando na integração entre áreas técnicas e administrativas.',
      areas: [
        'Planejamento e Controle da Produção (PCP)',
        'Gestão da Qualidade Industrial',
        'Logística e Cadeia de Suprimentos',
        'Manutenção Industrial',
        'Gestão de Projetos Industriais',
        'Automação e Inovação em Processos Produtivos',
        'Segurança do Trabalho e Meio Ambiente'
      ],
      minSalary: 2500,
      maxSalary: 7000,
      competencies: [
        'Análise e melhoria de processos produtivos',
        'Planejamento e controle de produção',
        'Gestão de equipes e liderança',
        'Tomada de decisão baseada em dados',
        'Conhecimento em normas de qualidade e segurança',
        'Uso de ferramentas de gestão (ERP, MRP, Lean Manufacturing)',
        'Comunicação eficaz e trabalho em equipe'
      ],
      category: 'Engenharia',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '150',
      title: 'Manutenção de Aeronaves',
      description: 'O curso de Manutenção de Aeronaves forma profissionais capacitados para realizar inspeções, manutenção preventiva e corretiva em aeronaves, garantindo a segurança e a conformidade técnica das operações aéreas. O tecnólogo aprende sobre sistemas aeronáuticos, normas regulatórias e processos de certificação, atuando diretamente na preservação da integridade estrutural e funcional das aeronaves.',
      areas: [
        'Manutenção preventiva e corretiva de aeronaves',
        'Inspeção e diagnóstico de sistemas aeronáuticos',
        'Gestão da qualidade e segurança em manutenção aeronáutica',
        'Documentação e certificação de aeronaves',
        'Serviços em oficinas e bases de manutenção de companhias aéreas',
        'Manutenção de motores e componentes aeronáuticos',
        'Controle de materiais e peças aeronáuticas'
      ],
      minSalary: 2500,
      maxSalary: 7000,
      competencies: [
        'Conhecimento técnico em sistemas elétricos, hidráulicos e estruturais de aeronaves',
        'Capacidade de realizar inspeções e diagnósticos precisos',
        'Domínio das normas da ANAC e órgãos internacionais de aviação',
        'Habilidade para interpretar manuais técnicos e diagramas',
        'Atenção rigorosa à segurança operacional',
        'Competência para trabalhar em equipe multidisciplinar',
        'Comunicação eficaz para elaboração de relatórios técnicos'
      ],
      category: 'Engenharia',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '151',
      title: 'Manutenção Industrial',
      description: 'O curso de Manutenção Industrial forma profissionais capacitados para planejar, executar e gerenciar processos de manutenção em sistemas industriais, garantindo a operação eficiente e segura de equipamentos. O tecnólogo aprende a aplicar técnicas de manutenção preditiva, preventiva e corretiva, além de utilizar ferramentas de gestão e automação industrial.',
      areas: [
        'Manutenção Mecânica',
        'Manutenção Elétrica',
        'Automação Industrial',
        'Gestão de Manutenção',
        'Análise de Vibrações e Termografia',
        'Controle de Qualidade em Manutenção',
        'Segurança do Trabalho Industrial'
      ],
      minSalary: 2200,
      maxSalary: 7000,
      competencies: [
        'Diagnóstico e solução de falhas em equipamentos industriais',
        'Planejamento e controle da manutenção',
        'Conhecimento em sistemas hidráulicos e pneumáticos',
        'Aplicação de normas técnicas e de segurança',
        'Uso de softwares de gestão de manutenção (CMMS)',
        'Trabalho em equipe e comunicação efetiva',
        'Capacidade analítica para otimização de processos'
      ],
      category: 'Engenharia',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '152',
      title: 'Mecatrônica Industrial',
      description: 'O curso de Mecatrônica Industrial forma profissionais capacitados a projetar, implementar e manter sistemas automatizados que integram mecânica, eletrônica e informática para otimizar processos industriais. O egresso atua no desenvolvimento e controle de máquinas e equipamentos inteligentes, garantindo eficiência e inovação nos ambientes produtivos.',
      areas: [
        'Automação Industrial',
        'Robótica Aplicada',
        'Manutenção de Sistemas Mecatrônicos',
        'Controle e Instrumentação Industrial',
        'Programação de CLPs e Sistemas Embarcados',
        'Projetos de Sistemas Automatizados',
        'Gestão de Processos Industriais'
      ],
      minSalary: 2500,
      maxSalary: 7000,
      competencies: [
        'Conhecimento em eletrônica, mecânica e informática aplicada',
        'Programação de controladores lógicos programáveis (CLPs)',
        'Capacidade de diagnóstico e manutenção de sistemas automatizados',
        'Desenvolvimento e integração de sistemas robotizados',
        'Leitura e interpretação de diagramas elétricos e mecânicos',
        'Trabalho em equipe e comunicação técnica',
        'Gestão de projetos e processos industriais'
      ],
      category: 'Engenharia',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '153',
      title: 'Sistemas Embarcados',
      description: 'O curso de Sistemas Embarcados forma profissionais capacitados a projetar, desenvolver e implementar sistemas computacionais integrados a dispositivos eletrônicos, atuando em aplicações que envolvem microcontroladores, automação e Internet das Coisas (IoT). O tecnólogo aprende a integrar hardware e software para criar soluções eficientes e inovadoras em diferentes setores industriais.',
      areas: [
        'Automação Industrial',
        'Internet das Coisas (IoT)',
        'Automotivo e Veículos Inteligentes',
        'Eletrônica de Consumo',
        'Telecomunicações',
        'Robótica',
        'Sistemas de Controle e Monitoramento'
      ],
      minSalary: 2500,
      maxSalary: 7000,
      competencies: [
        'Programação de microcontroladores e microprocessadores',
        'Desenvolvimento de software embarcado',
        'Projeto e integração de hardware e software',
        'Análise e solução de problemas técnicos',
        'Conhecimento em protocolos de comunicação',
        'Trabalho em equipe multidisciplinar',
        'Capacidade de inovação e adaptação tecnológica'
      ],
      category: 'Engenharia',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '154',
      title: 'Agrimensura',
      description: 'O curso de Agrimensura (Tecnólogo) capacita profissionais para realizar levantamentos topográficos, geodésicos e cadastrais, utilizando tecnologias de medição e geoprocessamento. O egresso está apto a atuar na coleta, análise e interpretação de dados espaciais para planejamento e gestão territorial.',
      areas: [
        'Topografia e Levantamentos Geodésicos',
        'Geoprocessamento e Sistemas de Informação Geográfica (SIG)',
        'Cadastro Técnico Multifinalitário',
        'Monitoramento Ambiental e Territorial',
        'Implantação de Obras e Infraestrutura',
        'Cartografia Digital',
        'Regularização Fundiária'
      ],
      minSalary: 2500,
      maxSalary: 7000,
      competencies: [
        'Operar equipamentos modernos de medição e posicionamento (GPS, estação total, drones)',
        'Analisar e interpretar dados espaciais e mapas temáticos',
        'Utilizar softwares de geoprocessamento e CAD',
        'Planejar e executar levantamentos topográficos com precisão',
        'Trabalhar em equipe multidisciplinar e comunicar resultados técnicos',
        'Gerenciar projetos cartográficos e de cadastro',
        'Atuar conforme normas técnicas e legislações vigentes'
      ],
      category: 'Engenharia',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '155',
      title: 'Construção de Edifícios',
      description: 'O curso de Construção de Edifícios forma profissionais capacitados para atuar no planejamento, execução e gestão de obras residenciais, comerciais e industriais. O tecnólogo aprende a elaborar projetos, controlar materiais e prazos, além de garantir a qualidade e a segurança nas construções.',
      areas: [
        'Planejamento e Gestão de Obras',
        'Orçamento e Controle de Custos',
        'Execução e Supervisão de Obras',
        'Fiscalização e Controle de Qualidade',
        'Segurança do Trabalho na Construção Civil',
        'Levantamento e Monitoramento de Obras',
        'Sustentabilidade e Tecnologias Construtivas'
      ],
      minSalary: 2200,
      maxSalary: 6500,
      competencies: [
        'Elaboração e interpretação de projetos arquitetônicos e estruturais',
        'Gestão de equipes e fornecedores',
        'Controle de qualidade e normas técnicas',
        'Levantamento e planejamento de cronogramas',
        'Análise e orçamento de materiais e serviços',
        'Conhecimento em segurança do trabalho',
        'Comunicação eficaz e resolução de problemas'
      ],
      category: 'Engenharia',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '156',
      title: 'Estradas',
      description: 'O curso de Tecnólogo em Estradas capacita o profissional para planejar, projetar, construir, operar e manter infraestruturas rodoviárias. O aluno aprende técnicas de pavimentação, drenagem, sinalização e gestão de obras viárias, visando garantir segurança, eficiência e sustentabilidade no transporte terrestre.',
      areas: [
        'Projetos de pavimentação e manutenção de rodovias',
        'Gestão e fiscalização de obras rodoviárias',
        'Consultoria em infraestrutura de transportes',
        'Análise e controle de qualidade de materiais para pavimentação',
        'Planejamento e logística de transporte terrestre',
        'Avaliação ambiental de projetos viários',
        'Sinalização e segurança viária'
      ],
      minSalary: 2500,
      maxSalary: 6500,
      competencies: [
        'Elaboração e análise de projetos de pavimentação',
        'Gestão de obras e equipes em empreendimentos rodoviários',
        'Análise de solos e materiais para infraestrutura viária',
        'Uso de softwares técnicos para projetos e controle de qualidade',
        'Capacidade de planejamento e organização',
        'Comunicação eficaz e trabalho em equipe',
        'Tomada de decisão baseada em normas técnicas e legislação vigente'
      ],
      category: 'Engenharia',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '157',
      title: 'Geoprocessamento',
      description: 'O curso superior de Tecnologia em Geoprocessamento capacita o profissional a coletar, analisar e interpretar dados geográficos utilizando ferramentas e sistemas de informação geográfica (SIG). O egresso estará apto a desenvolver soluções para o planejamento territorial, ambiental e urbano, integrando tecnologias de sensoriamento remoto e cartografia digital.',
      areas: [
        'Análise territorial e planejamento urbano',
        'Geotecnologias para meio ambiente',
        'Sensoriamento remoto e processamento de imagens',
        'Cartografia digital e mapeamento',
        'Sistemas de Informação Geográfica (SIG)',
        'Gestão de recursos naturais',
        'Georreferenciamento e cadastro técnico'
      ],
      minSalary: 2200,
      maxSalary: 6500,
      competencies: [
        'Operar softwares de SIG e CAD',
        'Realizar análise espacial e geostatística',
        'Interpretar imagens de satélite e aerofotogrametria',
        'Aplicar técnicas de georreferenciamento',
        'Desenvolver mapas temáticos e relatórios técnicos',
        'Trabalhar em equipes multidisciplinares',
        'Resolver problemas com foco em planejamento e sustentabilidade'
      ],
      category: 'Engenharia',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '158',
      title: 'Transporte Terrestre',
      description: 'O curso de Transporte Terrestre forma profissionais capacitados para planejar, operar e gerenciar sistemas de transporte rodoviário e ferroviário, garantindo eficiência, segurança e sustentabilidade. O egresso aprende sobre logística, infraestrutura, legislação e tecnologia aplicada ao transporte terrestre.',
      areas: [
        'Gestão de operações de transporte rodoviário',
        'Planejamento e controle de frotas',
        'Logística de transporte e distribuição',
        'Manutenção e gestão de infraestrutura viária',
        'Segurança e fiscalização em transportes terrestres',
        'Consultoria em mobilidade urbana',
        'Gestão de transportes ferroviários'
      ],
      minSalary: 2200,
      maxSalary: 6500,
      competencies: [
        'Planejamento e organização de rotas e cargas',
        'Conhecimento da legislação de trânsito e transporte',
        'Gestão de recursos e frota de veículos',
        'Capacidade de análise e solução de problemas operacionais',
        'Habilidade em tecnologias de monitoramento e controle',
        'Comunicação eficaz e trabalho em equipe',
        'Tomada de decisão baseada em dados e indicadores'
      ],
      category: 'Engenharia',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '159',
      title: 'Agroecologia',
      description: 'O curso de Tecnólogo em Agroecologia capacita profissionais para planejar, implementar e gerenciar sistemas agrícolas sustentáveis, integrando conhecimentos ecológicos, sociais e econômicos. O egresso atua na promoção da produção agroecológica, conservação ambiental e desenvolvimento rural sustentável.',
      areas: [
        'Produção Agroecológica',
        'Gestão de Recursos Naturais',
        'Extensão Rural e Assistência Técnica',
        'Educação Ambiental e Comunitária',
        'Certificação e Comercialização de Produtos Orgânicos',
        'Planejamento e Recuperação de Áreas Degradadas',
        'Desenvolvimento de Projetos de Agricultura Familiar'
      ],
      minSalary: 1800,
      maxSalary: 4500,
      competencies: [
        'Análise e manejo sustentável do solo e da água',
        'Implementação de técnicas agroecológicas e orgânicas',
        'Elaboração de projetos agroambientais',
        'Comunicação e trabalho em equipe com comunidades rurais',
        'Capacidade crítica para avaliação de impactos ambientais',
        'Gestão de sistemas produtivos integrados',
        'Conhecimento em políticas públicas de agricultura sustentável'
      ],
      category: 'Ciências Agrárias',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '160',
      title: 'Agronegócio',
      description: 'O curso de Agronegócio prepara profissionais para atuar na gestão, planejamento e análise de cadeias produtivas do setor agropecuário, integrando conhecimentos técnicos e administrativos. O tecnólogo desenvolve habilidades para otimizar processos, comercializar produtos e implementar estratégias sustentáveis no agronegócio.',
      areas: [
        'Gestão de propriedades rurais',
        'Comercialização e logística de produtos agropecuários',
        'Análise e planejamento de cadeias produtivas',
        'Consultoria e assessoria em agronegócios',
        'Marketing e desenvolvimento de mercados agrícolas',
        'Sustentabilidade e manejo ambiental no campo',
        'Tecnologia e inovação no agronegócio'
      ],
      minSalary: 2500,
      maxSalary: 7000,
      competencies: [
        'Planejamento estratégico e gestão financeira no agronegócio',
        'Análise de mercado e comercialização de produtos agropecuários',
        'Conhecimento de legislação e políticas públicas agrícolas',
        'Capacidade de negociação e liderança de equipes',
        'Uso de tecnologias da informação aplicadas ao campo',
        'Avaliação de impactos ambientais e práticas sustentáveis',
        'Comunicação eficaz e tomada de decisão'
      ],
      category: 'Ciências Agrárias',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '161',
      title: 'Aquicultura',
      description: 'O curso de Aquicultura (Tecnólogo) capacita o profissional para planejar, implementar e gerenciar sistemas de produção de organismos aquáticos, como peixes, moluscos e crustáceos. O aluno aprende técnicas de reprodução, cultivo, manejo ambiental e controle sanitário, visando sustentabilidade e eficiência produtiva.',
      areas: [
        'Produção e manejo de piscicultura',
        'Cultivo de moluscos e crustáceos',
        'Gestão de viveiros e tanques-rede',
        'Controle de qualidade da água e sanidade animal',
        'Projetos de sustentabilidade e manejo ambiental',
        'Indústrias de ração e insumos para aquicultura',
        'Pesquisa e extensão em aquicultura'
      ],
      minSalary: 1800,
      maxSalary: 5500,
      competencies: [
        'Planejamento e gestão de sistemas de produção aquícola',
        'Monitoramento e análise da qualidade da água',
        'Aplicação de técnicas de reprodução e larvicultura',
        'Identificação e controle de doenças em organismos aquáticos',
        'Implementação de práticas sustentáveis e manejo ambiental',
        'Utilização de tecnologias para otimização da produção',
        'Comunicação e trabalho em equipe multidisciplinar'
      ],
      category: 'Ciências Agrárias',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '162',
      title: 'Cafeicultura',
      description: 'O curso de Tecnólogo em Cafeicultura forma profissionais capacitados para atuar na produção, manejo e comercialização do café, integrando conhecimentos técnicos e científicos para otimizar a qualidade e sustentabilidade do cultivo. O profissional aprende a gerenciar sistemas produtivos, controlar pragas e doenças, e aplicar técnicas modernas de pós-colheita e análise sensorial do café.',
      areas: [
        'Produção agrícola de café',
        'Controle fitossanitário e manejo integrado de pragas',
        'Tecnologia e qualidade do café',
        'Gestão de propriedades rurais especializadas em cafeicultura',
        'Comercialização e marketing de café',
        'Pesquisa e desenvolvimento em cafeicultura',
        'Sustentabilidade e certificações ambientais'
      ],
      minSalary: 2500,
      maxSalary: 7000,
      competencies: [
        'Planejamento e manejo de lavouras de café',
        'Aplicação de técnicas de controle fitossanitário',
        'Análise e controle de qualidade do café',
        'Gestão financeira e administrativa de propriedades agrícolas',
        'Conhecimento em tecnologias pós-colheita',
        'Habilidades em comunicação e trabalho em equipe',
        'Capacidade de tomada de decisão baseada em dados técnicos'
      ],
      category: 'Ciências Agrárias',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '163',
      title: 'Horticultura',
      description: 'O curso de Horticultura Tecnólogo forma profissionais capacitados para planejar, produzir e gerenciar culturas hortícolas, visando a otimização da qualidade e produtividade. O estudante aprende técnicas de cultivo, manejo sustentável, controle fitossanitário e comercialização de produtos hortícolas.',
      areas: [
        'Produção e manejo de culturas hortícolas',
        'Controle fitossanitário e manejo integrado de pragas',
        'Gestão de propriedades hortícolas',
        'Pesquisa e desenvolvimento em tecnologias agrícolas',
        'Comercialização e logística de produtos hortícolas',
        'Consultoria técnica para produtores rurais',
        'Produção orgânica e sustentável'
      ],
      minSalary: 2000,
      maxSalary: 6000,
      competencies: [
        'Planejamento e manejo de culturas hortícolas',
        'Identificação e controle de pragas e doenças',
        'Aplicação de técnicas de irrigação e fertilização',
        'Análise e interpretação de solo e clima',
        'Gestão de propriedades rurais e processos produtivos',
        'Conhecimento em sustentabilidade e agricultura orgânica',
        'Comunicação efetiva e trabalho em equipe'
      ],
      category: 'Ciências Agrárias',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '164',
      title: 'Irrigação e Drenagem',
      description: 'O curso de Irrigação e Drenagem forma profissionais capacitados a planejar, projetar, executar e gerenciar sistemas de irrigação e drenagem para otimizar o uso da água na agricultura e em áreas urbanas. O tecnólogo desenvolve conhecimentos em hidráulica, manejo de recursos hídricos e tecnologias sustentáveis para garantir a eficiência produtiva e ambiental.',
      areas: [
        'Projetos de sistemas de irrigação agrícola',
        'Gestão de recursos hídricos para agricultura',
        'Monitoramento e manutenção de sistemas de drenagem urbana',
        'Consultoria em eficiência hídrica e sustentabilidade',
        'Automação e controle de sistemas de irrigação',
        'Análise e manejo de solos e água para irrigação',
        'Planejamento e operação de sistemas de irrigação por aspersão e gotejamento'
      ],
      minSalary: 2500,
      maxSalary: 7000,
      competencies: [
        'Elaboração e interpretação de projetos hidráulicos',
        'Aplicação de técnicas de irrigação e drenagem sustentáveis',
        'Utilização de softwares específicos para projeto e monitoramento',
        'Capacidade de análise crítica para otimização do uso da água',
        'Gestão de equipes e comunicação técnica',
        'Conhecimento das normas ambientais e legislações relacionadas',
        'Resolução de problemas técnicos em campo'
      ],
      category: 'Ciências Agrárias',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '165',
      title: 'Eventos',
      description: 'O curso de Eventos (Tecnólogo) prepara profissionais para planejar, organizar e gerenciar eventos de diferentes portes e segmentos, desenvolvendo habilidades em logística, comunicação e marketing. O aluno aprende a coordenar equipes, negociar com fornecedores e garantir a experiência do público-alvo, atuando em ambientes corporativos, culturais e sociais.',
      areas: [
        'Organização de eventos corporativos',
        'Eventos culturais e artísticos',
        'Eventos esportivos',
        'Eventos sociais e cerimoniais',
        'Planejamento e gestão de feiras e exposições',
        'Produção técnica e operacional de eventos',
        'Marketing e comunicação para eventos'
      ],
      minSalary: 1800,
      maxSalary: 6000,
      competencies: [
        'Planejamento e coordenação de eventos',
        'Gestão de fornecedores e negociações',
        'Logística e infraestrutura para eventos',
        'Comunicação eficaz e atendimento ao cliente',
        'Capacidade de trabalho em equipe e liderança',
        'Criatividade e resolução de problemas',
        'Conhecimento em legislação e normas aplicáveis'
      ],
      category: 'Turismo e Hospitalidade',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '166',
      title: 'Gastronomia',
      description: 'O curso de Gastronomia (Tecnólogo) prepara profissionais para atuar na criação, produção e gestão de alimentos e bebidas, com foco na qualidade, segurança alimentar e inovação culinária. O egresso aprende técnicas culinárias, planejamento de cardápios, controle de custos e gestão de empreendimentos gastronômicos.',
      areas: [
        'Cozinha profissional e gastronomia contemporânea',
        'Gestão de restaurantes e empreendimentos alimentícios',
        'Consultoria e desenvolvimento de cardápios',
        'Nutrição e segurança alimentar',
        'Eventos e catering',
        'Food styling e fotografia gastronômica',
        'Pesquisa e inovação em alimentos'
      ],
      minSalary: 1800,
      maxSalary: 6000,
      competencies: [
        'Domínio de técnicas culinárias e preparo de alimentos',
        'Planejamento e controle de custos operacionais',
        'Gestão de qualidade e segurança alimentar',
        'Criatividade e inovação na elaboração de pratos',
        'Capacidade de liderança e trabalho em equipe',
        'Habilidades de comunicação e atendimento ao cliente',
        'Conhecimento em legislação sanitária e ambiental'
      ],
      category: 'Turismo e Hospitalidade',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '167',
      title: 'Gestão de Turismo',
      description: 'O curso de Gestão de Turismo forma profissionais capacitados para planejar, organizar e gerenciar atividades turísticas, promovendo o desenvolvimento sustentável do setor. O aluno aprende sobre planejamento estratégico, marketing turístico, gestão de eventos e atendimento ao cliente, preparando-se para atuar em diferentes segmentos do turismo.',
      areas: [
        'Agências de viagens e operadoras de turismo',
        'Gestão de eventos e convenções',
        'Turismo receptivo e hospitalidade',
        'Planejamento e desenvolvimento turístico regional',
        'Consultoria em turismo sustentável',
        'Gestão de atrativos turísticos e parques temáticos',
        'Marketing e promoção turística'
      ],
      minSalary: 1500,
      maxSalary: 5500,
      competencies: [
        'Planejamento e organização de serviços turísticos',
        'Análise e pesquisa de mercado turístico',
        'Gestão financeira e orçamentária aplicada ao turismo',
        'Comunicação eficaz e atendimento ao cliente',
        'Capacidade de trabalho em equipe e liderança',
        'Uso de tecnologias para gestão turística',
        'Sustentabilidade e responsabilidade socioambiental'
      ],
      category: 'Turismo e Hospitalidade',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),

    Course(
      id: '168',
      title: 'Hotelaria',
      description: 'O curso de Tecnologia em Hotelaria forma profissionais capacitados para planejar, organizar e gerenciar serviços de hospedagem, garantindo a qualidade e a satisfação dos clientes. O aluno aprende sobre administração hoteleira, atendimento ao cliente, gestão de eventos e controle operacional, preparando-se para atuar em ambientes diversos do setor turístico e de hospitalidade.',
      areas: [
        'Gestão de meios de hospedagem',
        'Coordenação de serviços de recepção',
        'Administração de eventos e convenções',
        'Controle de qualidade em serviços hoteleiros',
        'Gestão de alimentos e bebidas',
        'Consultoria em hotelaria e turismo',
        'Planejamento e desenvolvimento de projetos hoteleiros'
      ],
      minSalary: 1800,
      maxSalary: 6000,
      competencies: [
        'Planejamento e organização de operações hoteleiras',
        'Gestão financeira e administrativa',
        'Atendimento ao cliente e comunicação eficaz',
        'Controle de qualidade e normas de segurança',
        'Liderança e trabalho em equipe',
        'Capacidade de resolução de problemas',
        'Conhecimento de sistemas de gestão hoteleira'
      ],
      category: 'Turismo e Hospitalidade',
      duration: 5,
      degreeType: 'Tecnólogo',
      university: 'Universidade Federal',
      rating: 4.5,
      reviews: 100,
    ),


  ];

  // Métodos de filtragem (mantidos iguais)
  static List<Course> getAllCourses() {
    return _courses;
  }

  static List<Course> searchCourses(String query) {
    if (query.isEmpty) return _courses;
    
    final lowerQuery = query.toLowerCase();
    return _courses.where((course) {
      return course.title.toLowerCase().contains(lowerQuery) ||
             course.category.toLowerCase().contains(lowerQuery) ||
             course.university.toLowerCase().contains(lowerQuery) ||
             course.areas.any((area) => area.toLowerCase().contains(lowerQuery)) ||
             course.competencies.any((comp) => comp.toLowerCase().contains(lowerQuery));
    }).toList();
  }

  static List<Course> filterCourses({
    String query = '',
    String category = 'Todos',
    double? minSalary,
    double? maxSalary,
    int? minDuration,
    int? maxDuration,
    List<String>? degreeTypes,
  }) {
    List<Course> filtered = _courses;

    // Filtro por pesquisa
    if (query.isNotEmpty) {
      filtered = searchCourses(query);
    }

    // Filtro por categoria
    if (category != 'Todos') {
      filtered = filtered.where((course) => course.category == category).toList();
    }

    // Filtro por salário
    if (minSalary != null) {
      filtered = filtered.where((course) => course.maxSalary >= minSalary).toList();
    }
    if (maxSalary != null) {
      filtered = filtered.where((course) => course.minSalary <= maxSalary).toList();
    }

    // Filtro por duração
    if (minDuration != null) {
      filtered = filtered.where((course) => course.duration >= minDuration).toList();
    }
    if (maxDuration != null) {
      filtered = filtered.where((course) => course.duration <= maxDuration).toList();
    }

    // Filtro por tipo de curso
    if (degreeTypes != null && degreeTypes.isNotEmpty) {
      filtered = filtered.where((course) => degreeTypes.contains(course.degreeType)).toList();
    }

    return filtered;
  }

  static List<String> getCategories() {
    return _courses.map((course) => course.category).toSet().toList();
  }

  static List<String> getDegreeTypes() {
    return ['Bacharelado', 'Licenciatura', 'Tecnólogo'];
  }

  static Course? getCourseById(String id) {
    try {
      return _courses.firstWhere((course) => course.id == id);
    } catch (e) {
      return null;
    }
  }

  // Métodos para obter valores mínimos e máximos para os filtros
  static double getMinSalary() {
    return _courses.map((course) => course.minSalary).reduce((a, b) => a < b ? a : b);
  }

  static double getMaxSalary() {
    return _courses.map((course) => course.maxSalary).reduce((a, b) => a > b ? a : b);
  }

  static int getMinDuration() {
    return _courses.map((course) => course.duration).reduce((a, b) => a < b ? a : b);
  }

  static int getMaxDuration() {
    return _courses.map((course) => course.duration).reduce((a, b) => a > b ? a : b);
  }
}