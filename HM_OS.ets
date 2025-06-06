import Course from "./Course";

@Component
export default struct HmOs {
  @Provide title: string[] = [ '合作', '推广' , '支持' ]

  build(): void {
    Course();
  }
}