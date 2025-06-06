@Component
export default struct Course {
  @Consume title: string[];
  @Builder
  itemBuilder(item: string): void {
    Row() {
      Text(item)
        .fontSize(20)
        .width('40%')

    }
    .width('90%')
    .height('10%')
    .backgroundColor('#F4F6F5')
    .borderRadius(10)
    .justifyContent(FlexAlign.Center)

  }
  @Builder
  listItemBuilder(): void {
    ForEach(this.title, (item: string) => {
      ListItem() {
        this.itemBuilder(item);
      }
    })
  }
  @Builder
  contentBuilder() {
    List({ space: 10 }) {
      this.listItemBuilder();
    }
  }
  build(): void {
    this.contentBuilder();
  }
}