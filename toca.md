# AntiGravity — Blueprint de Landing Page Cinematográfica (v2.0)
> Use este arquivo como “fonte única da verdade” no AntiGravity para gerar uma landing page cinematográfica, sofisticada, acolhedora e otimizada para conversão, seguindo a nova estrutura definida.

---

## 1) Identidade do Projeto
- **Nome do projeto:** Toca do Tamanduá terapias integradas
- **Produto/Serviço:** clínica multiprofissional especializada em desenvolvimento infantil.
- **Categoria/Nicho:** Saúde / Terapias Especializadas / Bem-estar.
- **Objetivo principal (1):** gerar contatos e agendamentos (Conversão)
- **Objetivos secundários (até 3):**
  - [x] fortalecer autoridade e confiança da clínica
  - [x] apresentar equipe qualificada e estrutura premium
  - [x] educar o paciente sobre especialidades e MVVP (Missão, Visão, Valores, Propósito)
- **CTA primário (texto curto):** Agendar consulta
- **CTA secundário (texto):** Conhecer especialidades
- **URL de destino do CTA:** inserir link do WhatsApp
- **Idioma:** pt-BR
- **Tom de voz:** acolhedor, confiante, premium, claro, humano
- **Personalidade da marca (3 a 6 adjetivos):** elegante, moderna, serena, confiável, sofisticada, empática
- **Nível de formalidade:** médio

---

## 2) Público-Alvo e Contexto
- **Para quem é:** pessoas que buscam atendimento especializado em saúde vascular, reabilitação, bem-estar e tratamentos integrados, valorizando um ambiente sofisticado e atendimento humanizado.
- **Dores principais (3–6):**
  1. Dores recorrentes e desconfortos circulatórios/vasculares.
  2. Medo de tratamentos invasivos ou diagnósticos errados.
  3. Sensação de atendimento "industrial" em grandes hospitais.
  4. Insegurança sobre a qualificação dos profissionais.
  5. Necessidade de um ambiente que transmita paz e acolhimento.
- **Desejos/Resultados (3–6):**
  1. Diagnóstico preciso e tratamento eficaz.
  2. Sentir-se acolhido, escutado e seguro (atendimento humanizado).
  3. Recuperação da qualidade de vida e mobilidade.
  4. Confiança total na equipe médica e terapêutica.
  5. Experiência premium e confortável durante todo o processo.
- **Objeções comuns (3–6):**
  1. “Será que essa clínica resolve o meu problema específico?”
  2. “Os profissionais são realmente qualificados (têm RQE, especializações)?”
  3. “Aceita meu plano ou o valor é acessível?”
  4. “É difícil agendar ou falar com eles?”
- **Prova/Confiança necessária:** apresentação detalhada da equipe (currículo/currículo Lattes), fotos reais da clínica (estrutura premium), depoimentos reais (Google Avaliações) e clareza nos tratamentos.

---

## 3) Proposta de Valor (mensagem central)
- **Headline (máx. 10 palavras, forte):**
  **Excelência vascular e cuidado integrado em um ambiente acolhedor.**
- **Subheadline (1–2 linhas, benefício + como):**
  Sua saúde vascular tratada com tecnologia de ponta, equipe multidisciplinar qualificada e o acolhimento que você merece.
- **Oferta/Promessa clara (sem exageros):**
  Uma experiência de cuidado completo, onde a sofisticação da estrutura se une à humanização do atendimento para sua reabilitação e bem-estar.
- **Diferenciais (3 bullets curtos):**
  - Equipe de especialistas referenciados (com currículo detalhado)
  - Abordagem multidisciplinar e integrada (MVVP clara)
  - Estrutura premium e moderna focada no conforto do paciente

---

## 4) Direção Cinematográfica (o “filme” da landing)
### 4.1 Atmosfera
- **Mood:** premium, sereno, contemporâneo, seguro, sofisticado
- **Ritmo:** calmo, elegante, fluido, com transições suaves (slow-motion feel)
- **Sensação que deve transmitir:** "Estou no lugar certo. Aqui eles cuidam de mim com excelência."
- **Estilo Fotográfico:** Luz natural suave (cinematográfica), profundidade de campo rasa (foco no que importa), texturas orgânicas e sutis, paleta de cores fiel à marca.

### 4.2 Referências visuais
- **Referência A:** estética editorial de revistas de design de interiores de luxo aplicadas à saúde.
- **Referência B:** visual minimalista com luz indireta e foco nos detalhes (mãos cuidando, ambiente limpo).
- **Referência C:** transições de página elegantes e parallax sutil.

---

## 5) Sistema Visual (Design Tokens - Baseado no Flutter AppColors)
> **OBRIGATÓRIO:** Usar as cores hexadecimais definidas abaixo, extraídas do código fornecido.

### 5.1 Cores
- **Cor Principal (Brand - Primary):** `#698183` (Verde Oliva Acinzentado Médio - para elementos de destaque, ícones fortes, talvez títulos secundários)
- **Cor Secundária (Accent - Secondary):** `#B6CCC1` (Verde Menta Suave/Pastel - para backgrounds secundários, detalhes sutis, highlights)
- **Background Primário (Scaffold):** `#F7FAF9` (Off-white muito claro e frio - fundo principal da página)
- **Superfície (Surface):** `#FFFFFF` (Branco Puro - para cards, containers elevados)
- **Texto Primário (TextDark):** `#1F2B2B` (Verde Escuro Quase Preto - para títulos principais H1, H2 e corpo de texto com alto contraste)
- **Texto Secundário (TextMuted):** `#4A5A5A` (Cinza Escuro Acinzentado - para subtextos, descrições longas, labels)

### 5.2 Tipografia
- **Fonte títulos (display):** **Poppins** (conforme definido no ThemeData). Pesos 600 (Semi-bold) a 700 (Bold).
- **Fonte texto (body):** **Poppins** (conforme definido no ThemeData). Pesos 400 (Regular) a 500 (Medium).
- **Escala sugerida:**
  - H1 (Hero): 48–64px (desktop) / 32–40px (mobile)
  - H2 (Seções): 32–40px / 26–30px
  - H3 (Cards/Subtítulos): 20–24px / 18–20px
  - Body: 16–18px / 16px
- **Espaçamento:** Aumentar o line-height para 1.6–1.8 para melhor leitura e sensação de respiro (premium).

### 5.3 Layout
- **Grid:** 12 colunas (desktop) / 4 colunas (mobile)
- **Max-width do conteúdo:** 1200px
- **Espaçamento vertical (Section padding):** 100–140px (desktop) / 60–80px (mobile) -> Gerar muito respiro.
- **Bordas (Radius):** 20–30px (suaves e modernas em cards e botões).
- **Sombras:** Quase invisíveis, extremamente suaves (diffuse shadows) para criar profundidade.

---

## 6) Motion & Interações (cinema sem exagero)
### 6.1 Princípios
- **Objetivo:** reforçar sofisticação, conduzir o olhar e criar fluidez.
- **Estilo:** Ease-out suave e lento.
- **Acessibilidade:** Respeitar `prefers-reduced-motion`.

### 6.2 Movimentos permitidos
- [x] Fade In + Translate Y sutil (revelar seções)
- [x] Parallax sutil em imagens de background da clínica
- [x] Hover delicado em botões (mudança de cor de fundo/sombra sutil)
- [x] Scroll suave (smooth scroll)

---

## 7) Conteúdo — Estrutura da Página (Storyline Atualizado)

### 7.1 Navbar (Fixa e Translúcida)
- **Logo:** Usar logo oficial da Angiofisio (lado esquerdo).
- **Menu (Ancoragem):** Clínica (MVVP), Especialidades, Equipe, Depoimentos, FAQ.
- **CTA:** Botão "Agendar Consulta" (Primary Color).

### 7.2 HERO (Abertura Moderna)
- **Design:** Ocupar 100vh (toda a primeira visão). Composição cinematográfica. Pode ser um vídeo de fundo em slow-motion (muito leve) mostrando o ambiente premium e o cuidado, ou uma imagem de altíssima qualidade. Overlay suave com as cores da marca.
- **Headline (H1):** **Excelência vascular e cuidado integrado em um ambiente acolhedor.**
- **Subheadline:** Sua saúde vascular tratada com tecnologia de ponta, equipe multidisciplinar qualificada e o acolhimento que você merece.
- **CTAs:**
  - Primário (Sólido): Agendar Consulta
  - Secundário (Outline/Ghost): Conhecer Especialidades
- **Microcopy de confiança:** Atendimento especializado e individualizado.

### 7.3 Seção: Apresentação da Clínica (Acolhimento + MVVP)
- **Título (H2):** Mais que uma clínica, um refúgio para sua saúde.
- **Texto de Introdução:** A Angiofisio une a sofisticação de um ambiente planejado com a calidez de um atendimento verdadeiramente humano. Nosso espaço foi desenhado para oferecer conforto, segurança e tranquilidade desde o primeiro momento.
- **Visual:** Imagem grande e premium da recepção ou fachada da clínica (luz quente).
- **Bloco MVVP (Cards Elegantes - Surface Color):**
  - **Missão:** Oferecer cuidado vascular integrado de excelência, promovendo saúde e bem-estar através de técnicas modernas e atendimento humanizado.
- **Visão:** Ser reconhecida como referência regional em saúde vascular e terapias integradas, destacando-se pela qualidade técnica e experiência do paciente.
  - **Valores:** Ética, Empatia, Excelência Técnica, Inovação, Cuidado Integral, Transparência.
  - **Propósito:** Transformar vidas através do cuidado dedicado à saúde vascular, devolvendo mobilidade, conforto e qualidade de vida.

### 7.4 Seção: Especialidades (O que fazemos)
- **Título (H2):** Cuidado especializado para cada necessidade.
- **Texto:** Atuamos de forma integrada em diferentes frentes para garantir sua reabilitação e bem-estar.
- **Formato:** Grid de cards elegantes (Surface Color), com ícones finos e refinados (Primary Color).
- **Conteúdo (Exemplos Genéricos mas com visual profissional):**
  1. **Saúde Vascular:** Diagnóstico e tratamento de doenças venosas e arteriais.
  2. **Angioterapia:** Tratamentos especializados para o sistema circulatório.
  3. **Reabilitação Funcional:** Recuperação de movimentos e fortalecimento pós-procedimentos.
  4. **Fisioterapia Especializada:** Acompanhamento dedicado a patologias vasculares.
  5. **Terapias Integradas:** Abordagens complementares para o bem-estar global.
  6. **Prevenção e Check-up:** Avaliações periódicas para manter sua circulação saudável.
- **Visual:** Cada card com ícone, título e uma descrição curta (2 linhas).

### 7.5 Seção: Equipe (Profissionais com Autoridade)
- **Título (H2):** Conhecimento técnico e cuidado humano ao seu dispor.
- **Texto:** Conheça os especialistas que compõem nossa equipe multidisciplinar, focados na sua saúde integral.
- **Formato:** Grid de cards de perfil (Surface Color).
- **Estrutura por Profissional (Obrigatória):**
  - **Foto:** Foto profissional de alta qualidade (padrão editorial).
  - **Nome Completo:** Dr(a). [Nome Genérico]
  - **Especialidade/Cargo:** Angiologista / Cirurgião Vascular / Fisioterapeuta
  - **Mini Bio (2 linhas):** [Breve descrição da atuação principal].
  - **Botão "Ver Currículo":** Abre um Modal ou Expansão Premium com o Currículo Detalhado (Formação, Especializações, Títulos, RQE, Experiência).
  - **Ícone Instagram:** Link para o perfil profissional.
- **Observação:** Usar conteúdo genérico mas com formatação e aparência 100% profissional.

### 7.6 Seção: Depoimentos (Prova Social - Google)
- **Título (H2):** O que nossos pacientes dizem sobre nós.
- **Visual:** Faixa elegante (pode usar Secondary Color de fundo). Estilo carrossel suave ou grid de cards de depoimento.
- **Formato:**
  - Foto do Paciente (ou inicial).
  - Nome do Paciente (primeiro nome).
  - Estrelas (5 estrelas - Dourado Suave).
  - Texto do Depoimento (focado em atendimento humanizado, resultado, estrutura).
  - Logo "Avaliado no Google".

### 7.7 Seção: Dúvidas Frequentes (FAQ)
- **Título (H2):** Perguntas Frequentes.
- **Formato:** Acordeão (Accordion) elegante e minimalista (Surface Color).
- **Exemplos de Conteúdo (Genéricos):**
  - "Quais são os principais tratamentos oferecidos?"
  - "Vocês aceitam planos de saúde/convênios?"
  - "Como faço para agendar minha primeira consulta?"
  - "Quais documentos preciso levar no dia do atendimento?"
  - "A clínica possui acessibilidade?"
- **Visual:** Ícones de abrir/fechar sutis.

### 7.8 Footer (Rodapé Completo)
- **Design:** Fundo escuro sutil (pode usar Primary Color desaturado ou Texto Dark) com texto claro.
- **Conteúdo:**
  - Logo Angiofisio (versão negativa/branca).
  - **Links de Navegação:** Clínica, Especialidades, Equipe, Contato.
  - **Informações de Contato:** Telefone, WhatsApp, Endereço Completo (com link para Google Maps), E-mail.
  - **Redes Sociais:** Ícones (Instagram, Facebook).
  - **Legal:** Responsável Técnico (Nome + CRM/CREFITO genérico), CNPJ, Copyright © 2026.

---

## 8) Conversão
- **Tipo:** Agendamento via WhatsApp (link direto).
- **Formulário Alternativo (opcional no FAQ ou Footer):** Nome, E-mail, Telefone, Mensagem.
- **Anti-fricção:** Botão de WhatsApp flutuante (Mobile e Desktop) visível após scroll do Hero.

---

## 9) Assets e Regras de Imagens
- **Obrigatório:** Usar o logo oficial fornecido.
- **Obrigatório:** Usar a imagem da entrada/recepção como base para a atmosfera da seção "A Clínica".
- **Estilo de Imagens:** Fotos reais da clínica são prioridade. Se faltar, usar stock photos de altíssima qualidade que sigam a estética premium, luz natural e a paleta de cores (`#B6CCC1`, `#F7FAF9`). Evitar imagens técnicas agressivas de procedimentos; focar no acolhimento e resultado.

---

## 10) SEO & Performance
- **H1:** Único, no Hero, contendo palavras-chave principais.
- **H2:** Nos títulos de seção.
- **Performance:** Imagens otimizadas (WebP/AVIF), lazy-loading, animações leves.

---

## 11) Instruções para o AntiGravity (Geração)
Gere uma landing page cinematográfica seguindo este blueprint v2.0 com:
1.  **Visual:** Premium, contemporâneo, acolhedor e altamente sofisticado.
2.  **Paleta de Cores:** Estritamente baseada nos hexadecimais `#698183` (Primary), `#B6CCC1` (Secondary), `#F7FAF9` (Background), `#1F2B2B` (TextDark).
3.  **Hero:** Impactante, ocupando 100vh com sensação de exclusividade e calma.
4.  **Storytelling:** Seguir a ordem exata das seções: Navbar -> Hero -> Clínica/MVVP -> Especialidades -> Equipe -> Depoimentos Google -> FAQ -> Footer.
5.  **Seção Equipe:** Cards premium com foto, currículo detalhado (em modal/expansão) e link para Instagram.
6.  **Depoimentos:** Visual de prova social real do Google.
7.  **Animações:** Suaves, lentas (lente de cinema) e refinadas.
8.  **Respiro:** Usar grandes espaçamentos verticais para passar sensação de luxo e organização.
9.  **Conteúdo:** Genérico mas com formatação e aparência profissional.

**Restrições:**
- Não usar cores fora da paleta fornecida.
- Não usar visual genérico de clínica comum/popular.
- Não deixar o site com aparência fria ou corporativa demais. Foco na humanização.