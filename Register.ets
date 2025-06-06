@Component
export default struct Register {
  @Consume('pageInfos') pageInfos: NavPathStack;
  @State buttonType: boolean = true;
  textTimerController: TextTimerController = new TextTimerController()
  @State signInButtonColor: string = '#F1A1AC';
  @State signInButtonLight: boolean = false;
  @State usernameInputIsEmpty: boolean = true;
  @State passwordInputIsEmpty: boolean = true;
  @State repeatPasswordInputIsEmpty: boolean = true;
  @State verificationInputIsEmpty: boolean = true;

  nameLength(input: string): boolean {
    let output: boolean = false;
    if (input.length == 0) {
      output = true;
    }
    return output;
  }
  freshUsernameInputIsEmpty(input: boolean): void {
    this.usernameInputIsEmpty = input;
  }
  freshVerificationInputIsEmpty(input: boolean): void {
    this.verificationInputIsEmpty = input;
  }
  freshPasswordInputIsEmpty(input: boolean): void {
    this.passwordInputIsEmpty = input;
  }
  freshRepeatPasswordInputIsEmpty(input: boolean): void {
    this.repeatPasswordInputIsEmpty = input;
  }
  freshColor(): void {
    let empty: boolean = this.usernameInputIsEmpty || this.verificationInputIsEmpty ||
    this.passwordInputIsEmpty || this.repeatPasswordInputIsEmpty;

    this.signInButtonLight = (empty == false);
  }
  getColor(): string {
    let color: string = '#F1A1AC';
    if (this.signInButtonLight) {
      color = '#EC697B';
    }
    return color;
  }
  useButton(): void {
    this.buttonType = false;
  }

  @Builder
  onButton() {
    Button('获取验证码', {type: ButtonType.Normal})
      .borderRadius(5)
      .backgroundColor('#EC697B')
      .height(30)
      .width(80)
      .fontSize(9)
      .margin({
        right: 10
      })
      .controlSize(ControlSize.SMALL)
      .onClick( () => {
        this.useButton();
      })
  }

  @Builder
  offButton() {
    Stack() {
      Button('重新获取'+'        '+'s', {type: ButtonType.Normal, stateEffect: false})
        .borderRadius(5)
        .backgroundColor('#EC697B')
        .height(30)
        .width(98)
        .fontSize(9)
        .margin({
          right: 10
        })
        .controlSize(ControlSize.SMALL)
        .opacity(0.6)
      this.timerBuilder()
    }

  }
  @Builder
  timerBuilder() {
    TextTimer({ isCountDown:true, count: 119000, controller: this.textTimerController})
      .format('ss')
      .onAppear(() => {
        this.textTimerController.start()
      })
      .margin({
        right: -32
      })
      .fontColor(Color.White)
      .fontSize(14)
      .onTimer((_utc: number, elapsedTime: number) => {
        if (elapsedTime == 60) {
          this.buttonType = true;
        }
      })
  }

  @Builder
  buttonBuilder() {
    Row() {
      if (this.buttonType) {
        this.onButton()
      } else {
        this.offButton()
      }
    }
    .margin({
      right: -200
    })
  }

  @Builder
  verificationBuilder() {
    Stack() {
      TextInput({ placeholder: '请输入验证码' })
        .type(InputType.Normal)
        .backgroundColor('#F4F6F5')
        .borderRadius(5)
        .onChange((verificationCode: string) => {
          this.freshVerificationInputIsEmpty(this.nameLength(verificationCode));
          this.freshColor();
        })
      this.buttonBuilder()
    }
  }

  @Builder
  passwordBuilder() {
    TextInput({ placeholder: '设置密码' })
      .type(InputType.Password)
      .backgroundColor('#F4F6F5')
      .borderRadius(5)
      .onChange((input: string) => {
        this.freshPasswordInputIsEmpty(this.nameLength(input));
        this.freshColor();
      })
    TextInput({ placeholder: '确认密码' })
      .type(InputType.Password)
      .backgroundColor('#F4F6F5')
      .borderRadius(5)
      .onChange((input: string) => {
        this.freshRepeatPasswordInputIsEmpty(this.nameLength(input));
        this.freshColor();
      })
  }

  @Builder
  findBUilder() {
    TextInput({ placeholder: '手机号/邮箱' })
      .type(InputType.Normal)
      .backgroundColor('#F4F6F5')
      .borderRadius(5)
      .onChange((input: string) => {
        this.freshUsernameInputIsEmpty(this.nameLength(input));
        this.freshColor();
      })
    this.passwordBuilder()
    this.verificationBuilder()

  }

  @Builder
  submitButtonBuilder() {
    Button('确定',{ type: ButtonType.Normal })
      .backgroundColor(this.getColor())
      .width('100%')
      .borderRadius(5)
      .onClick(() => {
        if (this.signInButtonLight) {
          this.pageInfos.pushPath({ name: 'RegisterSuccess' })
        }
      })
  }

  @Builder
  topicBuilder() {
    Text('快速注册')
      .fontColor('#EC697B')
      .fontSize(30)
      .fontWeight(FontWeight.Bold)
      .letterSpacing(2)
  }

  @Builder
  tailBuilder() {
    Row() {
      Divider()
        .width('20%')
        .color('#CFCFCF')
        .strokeWidth(1)
      Text('通鸿云')
        .fontColor('#CFCFCF')
        .margin({
          left: 10,
          right: 10
        })
        .fontSize(14)
      Divider()
        .width('20%')
        .color('#CFCFCF')
        .strokeWidth(1)
    }
    .width('100%')
    .justifyContent(FlexAlign.Center)
    .margin({
      top: 160
    })
  }

  build() {
    NavDestination() {
      Column({ space: 30 }) {
        this.topicBuilder()
        this.findBUilder()
        this.submitButtonBuilder()
        this.tailBuilder()
      }
      .height('100%')
      .width('85%')
      .justifyContent(FlexAlign.Center)
    }
    .hideBackButton(true)
  }
}