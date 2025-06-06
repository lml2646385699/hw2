interface Course {
  id: number
  title: string
  image: Resource
  price: number
  rating: number
  students: number
}

// 快捷入口组件
@Component
struct QuickEntry {
  @Consume('pageInfos') pageInfos: NavPathStack;
  @Prop iconPath: string
  @Prop label: string


  build() {
    Column() {
      Image($rawfile(this.iconPath))
        .width(26).height(26)
      Text(this.label)
        .fontSize(12)
        .textAlign(TextAlign.Center)
    }
    .onClick(() => {
      this.pageInfos.pushPath({ name: 'CourseContent' })
    })
  }
}

// 单个课程卡片组件
@Component
struct CourseCard {
  @Consume('pageInfos') pageInfos: NavPathStack;
  @Prop course: Course

  build() {
    Column() {
      Image(this.course.image)
        .width(140).height(90)
        .borderRadius(8)

      Text(this.course.title)
        .fontSize(14)
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .margin({ top: 5 })

      Row() {
        Text(`${this.course.students}人`)
          .fontSize(12)
          .fontColor(Color.Gray)

        Text(`评分: ${this.course.rating}`)
          .fontSize(12)
          .fontColor(Color.Gray)
          .margin({ left: 10 })
      }

      Text(`¥${this.course.price}`)
        .fontSize(14)
        .fontColor(Color.Red)
        .margin({ top: 4 })
    }
    .width(150)
    .onClick(() => {
      this.pageInfos.pushPath({ name: 'CourseContent' })
    })
  }
}

// 热门课程列表组件
@Component
struct HotCourseList {
  @Prop courses: Course[]

  build() {
    Column() {
      Text('热门课程')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Flex({
        direction: FlexDirection.Row,
        wrap: FlexWrap.Wrap,
        justifyContent: FlexAlign.Start,
      }) {
        ForEach(this.courses, (course: Course) => {
          CourseCard({ course: course })
        }, (course: Course) => course.id.toString())
      }

    }
    .padding(10)
    .width('90%')
    .alignSelf(ItemAlign.Center)
    .margin({ bottom: 20 })
  }
}

@Component
export default struct Index {
  @Consume('pageInfos') pageInfos: NavPathStack;
  scroll: Scroller = new Scroller;
  @State changeValue: string = ''
  @State submitValue: string = ''
  @State courseList: Course[] = [
    {
      id: 1,
      title: 'TypeScript快速入门',
      image: $rawfile('images/img.png'),
      price: 66.6,
      rating: 4.8,
      students: 56
    },
    {
      id: 2,
      title: 'ArkTS基础知识',
      image: $rawfile('images/img2.png'),
      price: 48.5,
      rating: 5.0,
      students: 55
    },
    {
      id: 3,
      title: 'ArkTS开发实践',
      image: $rawfile('images/img3.png'),
      price: 99.0,
      rating: 5.0,
      students: 42
    },
    {
      id: 4,
      title: '应用程序入口',
      image: $rawfile('images/img4.png'),
      price: 9.9,
      rating: 5.0,
      students: 92
    },
    {
      id: 5,
      title: 'ArkTS高级进阶',
      image: $rawfile('images/img.png'),
      price: 88.0,
      rating: 4.9,
      students: 80
    },
    {
      id: 6,
      title: '鸿蒙系统开发指南',
      image: $rawfile('images/img2.png'),
      price: 59.9,
      rating: 4.7,
      students: 70
    },
  ]

  @Builder
  indexBuilder(): void {
    Column() {
      // 搜索栏
      Search({ value: this.changeValue, placeholder: '问什么都可以' })
        .searchButton('搜索')
        .searchIcon({ src: $r('sys.media.ohos_ic_public_search_filled') })
        .width('90%')
        .height(30)
        .maxLength(90)
        .backgroundColor('#F5F5F5')
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 14, weight: 400 })
        .textFont({ size: 14, weight: 400 })
        .onSubmit((value: string) => this.submitValue = value)
        .onChange((value: string) => this.changeValue = value)
        .margin({ top: 15 })
        .alignSelf(ItemAlign.Center)

      // 轮播图
      Swiper() {
        Image($rawfile("images/swiper1.png")).width('100%').height(120)
        Image($rawfile("images/swiper2.png")).width('100%').height(120)
        Image($rawfile("images/swiper3.png")).width('100%').height(120)
      }
      .autoPlay(true)
      .height(120)
      .width('90%')
      .margin({ top: 10, bottom: 20 })
      .alignSelf(ItemAlign.Center)

      // 快捷入口区域
      Column() {
        Column() {
          Row() {
            QuickEntry({ iconPath: 'images/course.png', label: '课程' })
            QuickEntry({ iconPath: 'images/class.png', label: '班级' })
            QuickEntry({ iconPath: 'images/circle.png', label: '圈子' })
            QuickEntry({ iconPath: 'images/plan.png', label: '计划' })
          }
          .width('100%').justifyContent(FlexAlign.SpaceEvenly)
          .margin({ bottom: 20 })

          Row() {
            QuickEntry({ iconPath: 'images/exam.png', label: '测评' })
            QuickEntry({ iconPath: 'images/message.png', label: '消息' })
            QuickEntry({ iconPath: 'images/favorite.png', label: '我的收藏' })
            QuickEntry({ iconPath: 'images/recycle_bin.png', label: '回收站' })
          }
          .width('100%').justifyContent(FlexAlign.SpaceEvenly)
        }
        .backgroundColor('#F3F3F3')
        .borderRadius(20)
        .padding(10)
        .width('90%')
        .alignSelf(ItemAlign.Center)
      }

      // 热门课程列表
      HotCourseList({ courses: this.courseList })
    }
    .width('100%')
  }
  build() {
    Scroll(this.scroll) {
      this.indexBuilder();
    }
    .edgeEffect(EdgeEffect.Spring)
  }
}



