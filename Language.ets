import Course from "./Course";

@Component
export default struct Language {
  @Provide title: string[] = [ 'TypeScript快速入门', 'ArkTS基础知识', 'ArkTS开发实践',
    '应用程序入口', '基础组件的使用', '容器组件的介绍', '构建列表页面', '页签切换', '管理组件状态' ]

  build(): void {
    Course();
  }
}