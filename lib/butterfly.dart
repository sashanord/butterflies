class Butterfly{
  final String name;
  final String description;

  Butterfly(this.name, this.description);

  @override
  bool operator ==(Object other) {
    if (other is Butterfly){
      return name == other.name;
    }else return false;
  }
}