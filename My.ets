import { getUserInfo, UserInfo } from '../model/UserInfo';
import { User } from './Login/Login'
import PersonalizedRecommend from './InterestTags.ets';

@Component
export default struct My {
  @State userInfo: UserInfo = getUserInfo();
  @State currentPage: string = 'My';
  @Link user: User;
  @Consume('pageInfos') pageInfos: NavPathStack;
  @Builder
  myPage() {
    Column() {
      // 顶部导航
      Row() {
        Text('')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Black)
        Row({ space: 12 }) {
          Image($rawfile('images/设置.svg'))
            .width(26)
            .height(26)
            .onClick(() => {
              this.currentPage = 'Setting';
            })
          Image($rawfile('images/消息.svg')).width(26).height(26)
            .onClick(() => {
              this.currentPage = 'Message';
            })
        }
      }
      .width('100%')
      .padding({
        left: 16,
        right: 16,
        top: 0,
        bottom: 10
      })
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.SpaceBetween)

      // 用户信息区域
      Row() {
        Image($rawfile(this.userInfo.avatar))
          .width(64)
          .height(64)
          .margin({ right: 12 })
          .onClick(() => {
            this.pageInfos.pushPath({ name: 'EditProfile' })
          });
        Column() {
          Text(this.user.name)
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
            .align(Alignment.Start);
          Text(`UID: ${this.user.UID}`)
            .fontSize(16)
            .fontColor(Color.Gray)
            .align(Alignment.Start);
        }
        .alignItems(HorizontalAlign.Start)
        .width('auto')
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)
      .margin({ left: 0, right: 0, bottom: 24 })

      // 观看历史模块标题
      Text('观看历史')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .margin({
          left: 0,
          bottom: 8,
          top: 0,
          right: 0
        })
        .align(Alignment.Start)
        .textAlign(TextAlign.Start)
        .width('100%')

      // 观看历史功能区
      Row({ space: 0 }) {
        Column() {
          Image($rawfile('images/helloworld.jpg'))
            .width(44)
            .height(44)
            .margin({ bottom: 8 })
            .onClick(() => {
              this.currentPage = 'HistoryHelloWorld';
            });
          Text('Hello World入门')
            .fontSize(14)
            .width(100)
            .align(Alignment.Start)
            .textAlign(TextAlign.Start);
        }
        .alignItems(HorizontalAlign.Start)
        .width('50%')
        .padding({ left: 12, top: 12, bottom: 12 })

        Column() {
          Image($rawfile('images/TS.jpg'))
            .width(44)
            .height(44)
            .margin({ bottom: 8 })
            .onClick(() => {
              this.currentPage = 'HistoryTS';
            });
          Text('TS快速入门')
            .fontSize(14)
            .width(100)
            .align(Alignment.Start)
            .textAlign(TextAlign.Start);
        }
        .alignItems(HorizontalAlign.Start)
        .width('50%')
        .padding({ left: 12, top: 12, bottom: 12 })
      }
      .width('100%')
      .backgroundColor(Color.White)
      .borderRadius(12)
      .margin({
        top: 0,
        left: 0,
        right: 0,
        bottom: 20
      })

      // 我的内容模块标题
      Text('我的内容')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .margin({
          left: 0,
          bottom: 8,
          top: 0,
          right: 0
        })
        .align(Alignment.Start)
        .textAlign(TextAlign.Start)
        .width('100%')

      // 我的内容功能区
      Row({ space: 0 }) {
        Column() {
          Image($rawfile('images/作业.svg')).width(36).height(36).margin({ bottom: 8 })
            .onClick(() => {
              this.currentPage = 'Job';
            });
          Text('作业').fontSize(14).textAlign(TextAlign.Center).align(Alignment.Center);
        }.alignItems(HorizontalAlign.Center).width('25%');

        Column() {
          Image($rawfile('images/打卡.svg')).width(36).height(36).margin({ bottom: 8 })
            .onClick(() => {
              this.currentPage = 'ClockIn';
            });
          Text('打卡').fontSize(14).textAlign(TextAlign.Center).align(Alignment.Center);
        }.alignItems(HorizontalAlign.Center).width('25%');

        Column() {
          Image($rawfile('images/收藏.svg')).width(36).height(36).margin({ bottom: 8 })
            .onClick(() => {
              this.currentPage = 'Collection';
            });
          Text('收藏').fontSize(14).textAlign(TextAlign.Center).align(Alignment.Center);
        }.alignItems(HorizontalAlign.Center).width('25%');

        Column() {
          Image($rawfile('images/笔记.svg')).width(36).height(36).margin({ bottom: 8 })
            .onClick(() => {
              this.currentPage = 'Note';
            });
          Text('笔记').fontSize(14).textAlign(TextAlign.Center).align(Alignment.Center);
        }.alignItems(HorizontalAlign.Center).width('25%');
      }
      .margin({
        top: 0,
        left: 0,
        right: 0,
        bottom: 20
      })
      .padding({ top: 16, bottom: 16 })
      .width('100%')
      .backgroundColor(Color.White)
      .borderRadius(12)
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.Start)

      // 我的账户模块标题
      Text('我的账户')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .margin({
          left: 0,
          bottom: 8,
          top: 0,
          right: 0
        })
        .align(Alignment.Start)
        .textAlign(TextAlign.Start)
        .width('100%')

      // 我的账户功能区
      Row({ space: 0 }) {
        Column() {
          Image($rawfile('images/订单.svg')).width(36).height(36).margin({ bottom: 8 })
            .onClick(() => {
              this.currentPage = 'Order';
            });
          Text('订单').fontSize(14).textAlign(TextAlign.Center).align(Alignment.Center);
        }.alignItems(HorizontalAlign.Center).width('25%');

        Column() {
          Image($rawfile('images/优惠券.svg')).width(36).height(36).margin({ bottom: 8 })
            .onClick(() => {
              this.currentPage = 'Coupon';
            });
          Text('优惠券').fontSize(14).textAlign(TextAlign.Center).align(Alignment.Center);
        }.alignItems(HorizontalAlign.Center).width('25%');

        Column() {
          Image($rawfile('images/余额.svg')).width(36).height(36).margin({ bottom: 8 })
            .onClick(() => {
              this.currentPage = 'Balance';
            });
          Text('余额').fontSize(14).textAlign(TextAlign.Center).align(Alignment.Center);
        }.alignItems(HorizontalAlign.Center).width('25%');

        Blank().width('25%')
      }
      .margin({
        top: 0,
        left: 0,
        right: 0,
        bottom: 20
      })
      .padding({ top: 16, bottom: 16 })
      .width('100%')
      .backgroundColor(Color.White)
      .borderRadius(12)
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.Start)

      // 其他功能模块标题
      Text('其他功能')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .margin({
          left: 0,
          bottom: 8,
          top: 0,
          right: 0
        })
        .align(Alignment.Start)
        .textAlign(TextAlign.Start)
        .width('100%')

      // 其他功能功能区
      Row({ space: 0 }) {
        Column() {
          Image($rawfile('images/在线客服.svg')).width(36).height(36).margin({ bottom: 8 })
            .onClick(() => {
              this.currentPage = 'CustomerService';
            });
          Text('在线客服').fontSize(14).textAlign(TextAlign.Center).align(Alignment.Center);
        }.alignItems(HorizontalAlign.Center).width('25%');

        Column() {
          Image($rawfile('images/缓存.svg')).width(36).height(36).margin({ bottom: 8 })
            .onClick(() => {
              this.currentPage = 'Cache';
            });
          Text('缓存').fontSize(14).textAlign(TextAlign.Center).align(Alignment.Center);
        }.alignItems(HorizontalAlign.Center).width('25%');

        Blank().width('25%')
        Blank().width('25%')
      }
      .margin({
        top: 0,
        left: 0,
        right: 0,
        bottom: 20
      })
      .padding({ top: 16, bottom: 16 })
      .width('100%')
      .backgroundColor(Color.White)
      .borderRadius(12)
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.Start)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .backgroundColor('#F5F6FA')
  }

  @Builder
  jobPage() {
    Column() {
      Text('作业功能页面').fontSize(24).fontWeight(FontWeight.Bold).margin({ bottom: 20 });
      Button('返回').onClick(() => {
        this.currentPage = 'My';
      });
    }
    .alignItems(HorizontalAlign.Center).justifyContent(FlexAlign.Center).width('100%').height('100%')
  }

  @Builder
  clockInPage() {
    Column() {
      Text('打卡功能页面').fontSize(24).fontWeight(FontWeight.Bold).margin({ bottom: 20 });
      Button('返回').onClick(() => {
        this.currentPage = 'My';
      });
    }
    .alignItems(HorizontalAlign.Center).justifyContent(FlexAlign.Center).width('100%').height('100%')
  }

  @Builder
  collectionPage() {
    Column() {
      Text('收藏功能页面').fontSize(24).fontWeight(FontWeight.Bold).margin({ bottom: 20 });
      Button('返回').onClick(() => {
        this.currentPage = 'My';
      });
    }
    .alignItems(HorizontalAlign.Center).justifyContent(FlexAlign.Center).width('100%').height('100%')
  }

  @Builder
  notePage() {
    Column() {
      Text('笔记功能页面').fontSize(24).fontWeight(FontWeight.Bold).margin({ bottom: 20 });
      Button('返回').onClick(() => {
        this.currentPage = 'My';
      });
    }
    .alignItems(HorizontalAlign.Center).justifyContent(FlexAlign.Center).width('100%').height('100%')
  }

  @Builder
  orderPage() {
    Column() {
      Text('订单功能页面').fontSize(24).fontWeight(FontWeight.Bold).margin({ bottom: 20 });
      Button('返回').onClick(() => {
        this.currentPage = 'My';
      });
    }
    .alignItems(HorizontalAlign.Center).justifyContent(FlexAlign.Center).width('100%').height('100%')
  }

  @Builder
  couponPage() {
    Column() {
      Text('优惠券功能页面').fontSize(24).fontWeight(FontWeight.Bold).margin({ bottom: 20 });
      Button('返回').onClick(() => {
        this.currentPage = 'My';
      });
    }
    .alignItems(HorizontalAlign.Center).justifyContent(FlexAlign.Center).width('100%').height('100%')
  }

  @Builder
  balancePage() {
    Column() {
      Text('余额功能页面').fontSize(24).fontWeight(FontWeight.Bold).margin({ bottom: 20 });
      Button('返回').onClick(() => {
        this.currentPage = 'My';
      });
    }
    .alignItems(HorizontalAlign.Center).justifyContent(FlexAlign.Center).width('100%').height('100%')
  }

  @Builder
  customerServicePage() {
    Column() {
      Text('在线客服功能页面').fontSize(24).fontWeight(FontWeight.Bold).margin({ bottom: 20 });
      Button('返回').onClick(() => {
        this.currentPage = 'My';
      });
    }
    .alignItems(HorizontalAlign.Center).justifyContent(FlexAlign.Center).width('100%').height('100%')
  }

  @Builder
  cachePage() {
    Column() {
      Text('缓存功能页面').fontSize(24).fontWeight(FontWeight.Bold).margin({ bottom: 20 });
      Button('返回').onClick(() => {
        this.currentPage = 'My';
      });
    }
    .alignItems(HorizontalAlign.Center).justifyContent(FlexAlign.Center).width('100%').height('100%')
  }

  @Builder
  messagePage() {
    Column() {
      Text('消息页面').fontSize(24).fontWeight(FontWeight.Bold).margin({ bottom: 20 });
      Button('返回').onClick(() => {
        this.currentPage = 'My';
      });
    }
    .alignItems(HorizontalAlign.Center).justifyContent(FlexAlign.Center).width('100%').height('100%')
  }

  @Builder
  historyHelloWorldPage() {
    Column() {
      Text('Hello World入门历史页面').fontSize(24).fontWeight(FontWeight.Bold).margin({ bottom: 20 });
      Button('返回').onClick(() => {
        this.currentPage = 'My';
      });
    }
    .alignItems(HorizontalAlign.Center).justifyContent(FlexAlign.Center).width('100%').height('100%')
  }

  @Builder
  historyTSPage() {
    Column() {
      Text('TS快速入门历史页面').fontSize(24).fontWeight(FontWeight.Bold).margin({ bottom: 20 });
      Button('返回').onClick(() => {
        this.currentPage = 'My';
      });
    }
    .alignItems(HorizontalAlign.Center).justifyContent(FlexAlign.Center).width('100%').height('100%')
  }

  aboutToAppear() {
    this.userInfo = getUserInfo();
  }
  build() {
    if (this.currentPage === 'My') {
      this.myPage();
    } else if (this.currentPage === 'Job') {
      this.jobPage();
    } else if (this.currentPage === 'ClockIn') {
      this.clockInPage();
    } else if (this.currentPage === 'Collection') {
      this.collectionPage();
    } else if (this.currentPage === 'Note') {
      this.notePage();
    } else if (this.currentPage === 'Order') {
      this.orderPage();
    } else if (this.currentPage === 'Coupon') {
      this.couponPage();
    } else if (this.currentPage === 'Balance') {
      this.balancePage();
    } else if (this.currentPage === 'CustomerService') {
      this.customerServicePage();
    } else if (this.currentPage === 'Cache') {
      this.cachePage();
    } else if (this.currentPage === 'Message') {
      this.messagePage();
    } else if (this.currentPage === 'HistoryHelloWorld') {
      this.historyHelloWorldPage();
    } else if (this.currentPage === 'HistoryTS') {
      this.historyTSPage();
    } else if (this.currentPage === 'Setting') {
      SettingPage({ user: this.user });
    }
  }
}

@Component
struct SettingPage {
  @State currentSetting: string = 'main';
  @Link user: User;
  build() {
    if (this.currentSetting === 'main') {
      Column() {
        Text('设置')
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 40, bottom: 40 })
          .alignSelf(ItemAlign.Center);
        // 设置主目录列表
        Scroll() {
          Column() {
            Row() {
              Text('个人信息').fontSize(22).margin({ left: 24, top: 18, bottom: 18 })
              Blank().width('1%')
            }
            .backgroundColor('#FFF')
            .borderRadius(16)
            .margin({ left: 12, right: 12, top: 6, bottom: 6 })
            .onClick(() => { this.currentSetting = 'profile'; })
            Divider().color('#E0E0E0').strokeWidth(1).margin({ left: 24, right: 24 });

            Row() {
              Text('账号与安全').fontSize(22).margin({ left: 24, top: 18, bottom: 18 })
              Blank().width('1%')
            }
            .backgroundColor('#FFF')
            .borderRadius(16)
            .margin({ left: 12, right: 12, top: 6, bottom: 6 })
            .onClick(() => { this.currentSetting = 'account'; })
            Divider().color('#E0E0E0').strokeWidth(1).margin({ left: 24, right: 24 });

            Row() {
              Text('通知设置').fontSize(22).margin({ left: 24, top: 18, bottom: 18 })
              Blank().width('1%')
            }
            .backgroundColor('#FFF')
            .borderRadius(16)
            .margin({ left: 12, right: 12, top: 6, bottom: 6 })
            .onClick(() => { this.currentSetting = 'notification'; })
            Divider().color('#E0E0E0').strokeWidth(1).margin({ left: 24, right: 24 });

            Row() {
              Text('全局护眼').fontSize(22).margin({ left: 24, top: 18, bottom: 18 })
              Blank().width('1%')
            }
            .backgroundColor('#FFF')
            .borderRadius(16)
            .margin({ left: 12, right: 12, top: 6, bottom: 6 })
            .onClick(() => { this.currentSetting = 'eye'; })
            Divider().color('#E0E0E0').strokeWidth(1).margin({ left: 24, right: 24 });

            Row() {
              Text('家长监督').fontSize(22).margin({ left: 24, top: 18, bottom: 18 })
              Blank().width('1%')
            }
            .backgroundColor('#FFF')
            .borderRadius(16)
            .margin({ left: 12, right: 12, top: 6, bottom: 6 })
            .onClick(() => { this.currentSetting = 'parent'; })
            Divider().color('#E0E0E0').strokeWidth(1).margin({ left: 24, right: 24 });

            Row() {
              Text('清除缓存').fontSize(22).margin({ left: 24, top: 18, bottom: 18 })
              Blank().width('1%')
            }
            .backgroundColor('#FFF')
            .borderRadius(16)
            .margin({ left: 12, right: 12, top: 6, bottom: 6 })
            .onClick(() => { this.currentSetting = 'cache'; })
            Divider().color('#E0E0E0').strokeWidth(1).margin({ left: 24, right: 24 });

            Row() {
              Text('个性化推荐').fontSize(22).margin({ left: 24, top: 18, bottom: 18 })
              Blank().width('1%')
            }
            .backgroundColor('#FFF')
            .borderRadius(16)
            .margin({ left: 12, right: 12, top: 6, bottom: 6 })
            .onClick(() => { this.currentSetting = 'recommend'; })
            Divider().color('#E0E0E0').strokeWidth(1).margin({ left: 24, right: 24 });

            Row() {
              Text('关于').fontSize(22).margin({ left: 24, top: 18, bottom: 18 })
              Blank().width('1%')
            }
            .backgroundColor('#FFF')
            .borderRadius(16)
            .margin({ left: 12, right: 12, top: 6, bottom: 6 })
            .onClick(() => { this.currentSetting = 'about'; })
            Divider().color('#E0E0E0').strokeWidth(1).margin({ left: 24, right: 24 });

            Row() {
              Text('个人信息收集清单').fontSize(22).margin({ left: 24, top: 18, bottom: 18 })
              Blank().width('1%')
            }
            .backgroundColor('#FFF')
            .borderRadius(16)
            .margin({ left: 12, right: 12, top: 6, bottom: 6 })
            .onClick(() => { this.currentSetting = 'privacy'; })
            Divider().color('#E0E0E0').strokeWidth(1).margin({ left: 24, right: 24 });

            Row() {
              Text('第三方信息共享清单').fontSize(22).margin({ left: 24, top: 18, bottom: 18 })
              Blank().width('1%')
            }
            .backgroundColor('#FFF')
            .borderRadius(16)
            .margin({ left: 12, right: 12, top: 6, bottom: 6 })
            .onClick(() => { this.currentSetting = 'thirdparty'; })
            Divider().color('#E0E0E0').strokeWidth(1).margin({ left: 24, right: 24 });

            Row() {
              Text('退出登录').fontSize(20).fontColor(Color.Red).fontWeight(FontWeight.Medium).margin({ left: 24, top: 18, bottom: 18 })
              Blank().width('1%')
            }
            .backgroundColor('#FFF')
            .borderRadius(16)
            .margin({ left: 12, right: 12, top: 6, bottom: 6 })
            .onClick(() => { this.currentSetting = 'logout'; })
          }
        }
        .width('100%')
        .padding({ left: 0, right: 0 })
      }
      .width('100%').height('100%').backgroundColor('#F8F9FB');
    } else if (this.currentSetting === 'profile') {
      Column() {
        Text('个人信息').fontSize(22).fontWeight(FontWeight.Bold).margin({ top: 30, bottom: 20 });
        Text(`姓名：${this.user.name}`).fontSize(16).margin({ bottom: 10 });
        Text(`UID：${this.user.UID}`).fontSize(16).margin({ bottom: 10 });
        Text('邮箱：').fontSize(16).margin({ bottom: 10 });
        Text('兴趣标签：').fontSize(16).margin({ bottom: 10 });
        Text('个人简介：').fontSize(16).margin({ bottom: 10 });
        Button('编辑').onClick(() => { /* 跳转编辑 */ });
        Button('返回').onClick(() => { this.currentSetting = 'main'; }).margin({ top: 30 });
      }.width('100%').alignItems(HorizontalAlign.Center)
    } else if (this.currentSetting === 'account') {
      Column() {
        Text('账号与安全').fontSize(22).fontWeight(FontWeight.Bold).margin({ top: 30, bottom: 20 });
        Text(`登录账号：${this.user.name}`).fontSize(16).margin({ bottom: 10 });
        Text(`UID：${this.user.UID}`).fontSize(16).margin({ bottom: 10 });
        Button('管理').onClick(() => { /* 跳转管理 */ });
        Button('返回').onClick(() => { this.currentSetting = 'main'; }).margin({ top: 30 });
      }.width('100%').alignItems(HorizontalAlign.Center)
    } else if (this.currentSetting === 'notification') {
      Column() {
        Text('通知设置').fontSize(22).fontWeight(FontWeight.Bold).margin({ top: 30, bottom: 20 });
        Text('自定义通知方式和频率').fontSize(16).margin({ bottom: 10 });
        Button('设置').onClick(() => { /* 跳转设置 */ });
        Button('返回').onClick(() => { this.currentSetting = 'main'; }).margin({ top: 30 });
      }.width('100%').alignItems(HorizontalAlign.Center)
    } else if (this.currentSetting === 'eye') {
      Column() {
        Text('全局护眼').fontSize(22).fontWeight(FontWeight.Bold).margin({ top: 30, bottom: 20 });
        Text('开启护眼模式可降低屏幕亮度').fontSize(16).margin({ bottom: 10 });
        Button('开启护眼模式').onClick(() => { /* 开启护眼 */ });
        Button('返回').onClick(() => { this.currentSetting = 'main'; }).margin({ top: 30 });
      }.width('100%').alignItems(HorizontalAlign.Center)
    } else if (this.currentSetting === 'parent') {
      Column() {
        Text('家长监督').fontSize(22).fontWeight(FontWeight.Bold).margin({ top: 30, bottom: 20 });
        Text('家长可绑定孩子账号，监控学习进度').fontSize(16).margin({ bottom: 10 });
        Button('绑定孩子账号').onClick(() => { /* 绑定 */ });
        Button('返回').onClick(() => { this.currentSetting = 'main'; }).margin({ top: 30 });
      }.width('100%').alignItems(HorizontalAlign.Center)
    } else if (this.currentSetting === 'cache') {
      Column() {
        Text('清除缓存').fontSize(22).fontWeight(FontWeight.Bold).margin({ top: 30, bottom: 20 });
        Text('释放存储空间，提高运行速度').fontSize(16).margin({ bottom: 10 });
        Button('清除').onClick(() => { /* 清除缓存 */ });
        Button('返回').onClick(() => { this.currentSetting = 'main'; }).margin({ top: 30 });
      }.width('100%').alignItems(HorizontalAlign.Center)
    } else if (this.currentSetting === 'recommend') {
      Column() {
        Text('个性化推荐').fontSize(22).fontWeight(FontWeight.Bold).margin({ top: 30, bottom: 20 });
        PersonalizedRecommend();
        Button('返回').onClick(() => { this.currentSetting = 'main'; }).margin({ top: 30 });
      }.width('100%').alignItems(HorizontalAlign.Center)
    } else if (this.currentSetting === 'about') {
      Column() {
        Text('关于').fontSize(22).fontWeight(FontWeight.Bold).margin({ top: 30, bottom: 20 });
        Text('版本：v1.0.0').fontSize(16).margin({ bottom: 10 });
        Text('版权所有：通鸿云课堂').fontSize(16).margin({ bottom: 10 });
        Text('开发者联系方式：dev@example.com').fontSize(16).margin({ bottom: 10 });
        Button('返回').onClick(() => { this.currentSetting = 'main'; }).margin({ top: 30 });
      }.width('100%').alignItems(HorizontalAlign.Center)
    } else if (this.currentSetting === 'privacy') {
      Column() {
        Text('个人信息收集清单').fontSize(22).fontWeight(FontWeight.Bold).margin({ top: 30, bottom: 20 });
        Text('APP收集的个人信息类型和用途...').fontSize(16).margin({ bottom: 10 });
        Button('返回').onClick(() => { this.currentSetting = 'main'; }).margin({ top: 30 });
      }.width('100%').alignItems(HorizontalAlign.Center)
    } else if (this.currentSetting === 'thirdparty') {
      Column() {
        Text('第三方信息共享清单').fontSize(22).fontWeight(FontWeight.Bold).margin({ top: 30, bottom: 20 });
        Text('合作第三方服务商及信息共享细节...').fontSize(16).margin({ bottom: 10 });
        Button('返回').onClick(() => { this.currentSetting = 'main'; }).margin({ top: 30 });
      }.width('100%').alignItems(HorizontalAlign.Center)
    } else if (this.currentSetting === 'logout') {
      Column() {
        Text('确定要退出登录吗？').fontSize(20).fontColor(Color.Red).margin({ top: 30, bottom: 20 });
        Button('退出').onClick(() => { /* 退出登录逻辑 */ });
        Button('取消').onClick(() => { this.currentSetting = 'main'; }).margin({ top: 30 });
      }.width('100%').alignItems(HorizontalAlign.Center)
    }
  }
}