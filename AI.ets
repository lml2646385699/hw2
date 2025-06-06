import Course from './Course'
@Component
export default struct AI {
  @Provide title: string[] = [ '机器学习', '深度学习', '计算机视觉', '矩阵论' ]
  build(): void {
    Course();
  }
}