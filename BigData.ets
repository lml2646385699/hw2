import Course from "./Course"

@Component
export default struct BigData {
  @Provide title: string[] = [ 'Hadoop', '数据挖掘', '数据可视化' ]

  build(): void {
    Course()
  }
}