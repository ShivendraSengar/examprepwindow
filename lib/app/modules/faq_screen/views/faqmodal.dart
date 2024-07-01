class AccordionItem {
  final int id;
  final String title;
  final String answer;
  final String? screen;

  AccordionItem({
    required this.id,
    required this.title,
    required this.answer,
    this.screen,
  });
}
