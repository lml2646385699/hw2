import Course from "./Course";

@Component
export default struct Authentication {
  @Provide title: string[] = [ '初级认证', '中级认证', '高级认证' ]

  build(): void {
    Course();
  }
}