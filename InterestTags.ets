interface Category {
  name: string;
  tags: string[];
}

@Component
export default struct PersonalizedRecommend {
  @Consume('pageInfos') pageInfos: NavPathStack;
  categories: Category[] = [
    { name: '语言', tags: ['ArkTS', 'ArkUI', 'JavaScript', 'TypeScript'] },
    { name: '职业', tags: ['职场提升', '商业管理', '设计创作', '其他技能'] },
    { name: '认证', tags: ['软考高级', '建筑二级', '公共安全'] },
    { name: 'HM OS', tags: ['生态介绍', '开发工具', '开发语言', '应用开发', '集成能力', '应用上架', '运营增长'] },
    { name: '大数据', tags: ['Spark', 'Oozie', 'HBase', 'Sqoop', 'Flume'] },
    { name: '华为云', tags: ['ECS', 'OBS', 'IoT'] },
    { name: '人工智能', tags: ['Python'] }
  ];
  @State selectedTags: string[] = [];

  chunkArray(arr: string[], size: number): string[][] {
    const res: string[][] = [];
    for (let i = 0; i < arr.length; i += size) {
      res.push(arr.slice(i, i + size));
    }
    return res;
  }

  @Builder
  interestTagsBuilder() {
    Column() {
      // 滚动内容区域
      Scroll() {
        Column() {
          // 顶部标题栏
          Text('个性化推荐设置')
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Black)
            .margin({ top: 16, bottom: 8 })
            .width('100%')
            .textAlign(TextAlign.Start)

          // 副标题
          Text('获取更精准的内容推荐，赢得高效的学习效果')
            .fontSize(14)
            .fontColor('#666666')
            .margin({ bottom: 16 })
            .width('100%')
            .textAlign(TextAlign.Start)

          // 顶部"选好了"按钮
          Button(`选好了（${this.selectedTags.length}）`)
            .width('90%')
            .height(40)
            .backgroundColor('#EC697B')
            .fontColor(Color.White)
            .fontSize(16)
            .borderRadius(20)
            .margin({ top: 0, bottom: 16 })
            .alignSelf(ItemAlign.Center)
            .onClick(() => {
              AlertDialog.show({ message: `已选择标签: ${this.selectedTags.join(', ')}`, autoCancel: true });
              if (this.pageInfos && this.pageInfos.pushPath) {
                this.pageInfos.pushPath({ name: 'MainPage' });
              }
            })

          // 标签分类区域
          ForEach(this.categories, (category: Category) => {
            Column() {
              Text(category.name)
                .fontSize(18)
                .fontWeight(FontWeight.Medium)
                .margin({ top: 16, bottom: 8 })
                .width('100%')
                .textAlign(TextAlign.Start)

              // 标签区域
              Flex({ direction: FlexDirection.Row, wrap: FlexWrap.Wrap }) {
                ForEach(category.tags, (tag: string) => {
                  Button(tag)
                    .backgroundColor(this.selectedTags.includes(tag) ? '#EC697B' : '#F3F3F3')
                    .fontColor(this.selectedTags.includes(tag) ? Color.White : Color.Black)
                    .margin({ right: 8, bottom: 8 })
                    .onClick(() => {
                      if (this.selectedTags.includes(tag)) {
                        this.selectedTags = this.selectedTags.filter(t => t !== tag);
                      } else {
                        this.selectedTags = [...this.selectedTags, tag];
                      }
                    });
                });
              }
            }
          });
        }
      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFF')
  }

  build() {
    this.interestTagsBuilder();
  }
}
