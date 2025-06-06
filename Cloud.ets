import Course from "./Course";

@Component
export default struct Cloud {
  @Provide title: string[] = [ '计算', '存储', '数据库', 'IoT' ]

  build(): void {
    Course();
  }
}