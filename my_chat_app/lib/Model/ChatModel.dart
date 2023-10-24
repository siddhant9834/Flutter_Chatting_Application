class ChatModel {
  String? name;
  String? icon;
  bool? isGroup;
  String? timer;
  String? status;
  String? currentMessage;
  bool? select;
  int? id;

  ChatModel(
      {
      required  this.name,
      required this.icon ,
        this.isGroup,
         this.timer,
      this.currentMessage,
         this.status,
         this.select,
         this.id,
});
}
