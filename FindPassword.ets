@Component
export default struct FindPassword {
  @Consume('pageInfos') pageInfos: NavPathStack;
  @State buttonType: boolean = true;
  textTimerController: TextTimerController = new TextTimerController()
  @State signInButtonColor: string = '#F1A1AC';
  @State signInButtonLight: boolean = false;
  @State usernameInputIsEmpty: boolean = true;
  @State verificationInputIsEmpty: boolean = true;
  @Link verificationCode: number;
  @State verificationCodeOpacity: number = 0;
  @State tipOpacity: number = 0;
  @State usernameInput: string = '';
  @State verificationCodeInput: string = ''


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
  freshColor(): void {
    let empty: boolean = this.usernameInputIsEmpty || this.verificationInputIsEmpty;
    this.signInButtonLight = (empty == false);
  }
  getColor(): string {
    let color: string = '#F1A1AC';
    if (this.signInButtonLight) {
      color = '#EC697B';
    }
    return color;
  }
  showTip(): void {
    this.tipOpacity = 1;
  }
  clearTip(): void {
    this.tipOpacity = 0;
  }
  useButton(): void {
    this.buttonType = false;
  }
  initializeVerificationCode(): void {
    this.verificationCode = Math.round(Math.random() * 1e6);
  }
  showVerificationCode(): void {
    this.verificationCodeOpacity = 0.4;
  }
  closePopView(): void {
    this.verificationCodeOpacity = 0;
  }
  changeUsername(input: string): void {
    this.usernameInput = input;
  }
  changeVerificationCode(input: string): void {
    this.verificationCodeInput = input;
  }
  @Builder
  verificationCodeBuilder(): void {
    Button({stateEffect: false}) {
      Row() {
        Text('通鸿云验证码  ')
          .fontColor(Color.White)
        Text(this.verificationCode.toString())
          .fontColor(Color.White)
          .fontSize(36)
      }
    }
    .backgroundColor('#EC697B')
    .opacity(this.verificationCodeOpacity)
    .margin({
      top: -420
    })
    .height('10%')
    .width('80%')
    .onClick(() => {
      if ((this.verificationCodeOpacity == 0) == false) {
        this.pageInfos.pushPath({ name: 'VerificationCode' })
      }
    })
  }
  @Builder
  onButton(): void {
    Button('获取验证码', { type: ButtonType.Normal })
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
  errorTipBuilder(): void {
    Text('验证码错误')
      .fontColor(Color.Red)
      .margin({
        bottom: -70,
        left: -240
      })
      .fontSize(14)
      .opacity(this.tipOpacity)
  }
  @Builder
  offButton(): void {
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
  timerBuilder(): void {
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
        if (elapsedTime == 3) {
          this.initializeVerificationCode();
          this.showVerificationCode();
        } else if (elapsedTime == 9) {
          this.closePopView();
        } else if (elapsedTime == 60) {
          this.buttonType = true;
        }
      })
  }

  @Builder
  buttonBuilder(): void {
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
  verificationBuilder(): void {
    Stack() {
      TextInput({ placeholder: '请输入验证码' })
        .type(InputType.Normal)
        .backgroundColor('#F4F6F5')
        .borderRadius(5)
        .onChange((verificationCode: string) => {
          this.changeVerificationCode(verificationCode)
          this.freshVerificationInputIsEmpty(this.nameLength(verificationCode));
          this.freshColor();
        })
      this.buttonBuilder()
      this.verificationCodeBuilder()
      this.errorTipBuilder()
    }

  }
  @Builder
  findBuilder(): void {
    TextInput({ placeholder: '手机号/邮箱' })
      .type(InputType.Normal)
      .backgroundColor('#F4F6F5')
      .borderRadius(5)
      .onChange((username: string) => {
        this.changeUsername(username)
        this.freshUsernameInputIsEmpty(this.nameLength(username));
        this.freshColor();
      })
    this.verificationBuilder()
  }

  @Builder
  submitButtonBuilder(): void {
    Button('确定',{ type: ButtonType.Normal, stateEffect: this.signInButtonLight })
      .backgroundColor(this.getColor())
      .width('100%')
      .borderRadius(5)
      .onClick(() => {
        if (this.signInButtonLight && this.verificationCodeInput == this.verificationCode.toString()) {
          this.clearTip();
          this.pageInfos.pushPath({ name: 'ExchangePassword' });
        }
        else if (this.signInButtonLight) {
          this.showTip();
        }
      })
  }

  @Builder
  topicBuilder(): void {
    Text('找回密码')
      .fontColor('#EC697B')
      .fontSize(30)
      .fontWeight(FontWeight.Bold)
      .letterSpacing(2)
  }
  @Builder
  tailBuilder(): void {
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
      top: 320
    })
  }

  build(): void {
    NavDestination() {
      Column({ space: 30 }) {
        this.topicBuilder()
        this.findBuilder()
        this.submitButtonBuilder()
        this.tailBuilder()
      }
      .width('85%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
    .hideBackButton(true)
  }
}