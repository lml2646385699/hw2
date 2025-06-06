import Course from "./Course";

@Component
export default struct Job {
  @Provide title: string[] = [ '程序员', '工程师' ]

  build(): void {
    Course();
  }
}