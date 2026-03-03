class FaqItem {
  final String question;
  final String answer;

  const FaqItem({
    required this.question,
    required this.answer,
  });
}

const faqData = <FaqItem>[
  FaqItem(
    question: 'Para quais crianças a clínica é indicada?',
    answer:
        'Atendimento voltado a bebês, crianças e adolescentes com atrasos no desenvolvimento, transtornos do neurodesenvolvimento, síndromes genéticas e dificuldades motoras, cognitivas, sensoriais, emocionais ou comportamentais.',
  ),
  FaqItem(
    question: 'A clínica atende convênios?',
    answer:
        'Não realiza atendimento por convênios ou planos de saúde. São emitidos os documentos necessários para solicitação de reembolso junto ao plano e para fins de declaração de imposto de renda.',
  ),
  FaqItem(
    question: 'Como saber se meu filho precisa de avaliação?',
    answer:
        'Sinais como atrasos no desenvolvimento, dificuldades motoras, seletividade alimentar intensa, alterações sensoriais, dificuldades de atenção ou comportamento podem indicar necessidade de avaliação especializada.',
  ),
  FaqItem(
    question: 'A família participa do processo terapêutico?',
    answer:
        'A família é parte fundamental do processo terapêutico, com orientações e alinhamentos periódicos. A participação nas sessões ocorre sempre que possível.',
  ),
  FaqItem(
    question: 'É necessário encaminhamento médico para iniciar?',
    answer:
        'Não é obrigatório. A avaliação pode ser iniciada a partir da demanda da família. Quando necessário, é realizada articulação com o médico e demais profissionais envolvidos.',
  ),
  FaqItem(
    question: 'O atendimento é individual ou em grupo?',
    answer:
        'Os atendimentos são individualizados, conforme avaliação inicial e plano terapêutico definido pela equipe.',
  ),
  FaqItem(
    question: 'Como funciona a primeira avaliação?',
    answer:
        'Entrevista detalhada com os pais ou responsáveis para compreender a história do desenvolvimento, rotina, dificuldades do cotidiano, aspectos sensoriais, comportamentais e fatores orgânicos relevantes. Pode ser realizada de forma online.',
  ),
  FaqItem(
    question: 'Qual a forma de pagamento aceita?',
    answer:
        'O pagamento é realizado via PIX.',
  ),
  FaqItem(
    question: 'Como agendo uma consulta?',
    answer:
        'Os agendamentos são realizados diretamente via WhatsApp com a recepção.',
  ),
  FaqItem(
    question: 'Preciso agendar ou vocês atendem por ordem de chegada?',
    answer:
        'Todos os atendimentos são realizados mediante agendamento prévio, com horários definidos.',
  ),
  FaqItem(
    question: 'A clínica trabalha com intervenção baseada em evidências?',
    answer:
        'As intervenções são fundamentadas em modelos teóricos consolidados e evidências científicas atualizadas, respeitando as especificidades do desenvolvimento infantil e as necessidades individuais de cada criança.',
  ),
  FaqItem(
    question: 'Há reavaliações ao longo do acompanhamento?',
    answer:
        'Sim. O processo terapêutico inclui reavaliações periódicas para monitorar evolução, ajustar estratégias e redefinir objetivos conforme o progresso da criança.',
  ),
  FaqItem(
    question: 'A equipe trabalha de forma integrada?',
    answer:
        'Os profissionais atuam de forma interdisciplinar, com discussão de casos e alinhamento de condutas, garantindo coerência e continuidade no cuidado.',
  ),
];