import { User } from "./Login";

@Component
export default struct ExchangePassword {
  @Consume('pageInfos') pageInfos: NavPathStack;
  @State buttonType: boolean = true;
  @State signInButtonColor: string = '#F1A1AC';
  @State signInButtonLight: boolean = false;
  @State passwordInputIsEmpty: boolean = true;
  @State passwordRepeatedInputIsEmpty: boolean = true;
  @State passwordInput: string = '';
  @State passwordRepeatedInput: string = '';
  @State tipOpacity: number = 0;
  @Link user: User;

  showTip(): void {
    this.tipOpacity = 1;
  }
  clearTip(): void {
    this.tipOpacity = 0;
  }
  changeRepeatedPassword(password: string): void {
    this.passwordRepeatedInput = password;
  }
  changePassword(password: string): void {
    this.passwordInput = password;
  }
  nameLength(input: string): boolean {
    let output: boolean = false;
    if (input.length == 0) {
      output = true;
    }
    return output;
  }
  freshPasswordInputIsEmpty(input: boolean): void {
    this.passwordInputIsEmpty = input;
  }
  freshPasswordRepeatedInputIsEmpty(input: boolean): void {
    this.passwordRepeatedInputIsEmpty = input;
  }
  freshColor(): void {
    let empty: boolean = this.passwordInputIsEmpty || this.passwordRepeatedInputIsEmpty;
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
  findBuilder(): void {
    TextInput({ placeholder: '新密码' })
      .type(InputType.Password)
      .backgroundColor('#F4F6F5')
      .borderRadius(5)
      .onChange((password: string) => {
        this.changePassword(password);
        this.freshPasswordInputIsEmpty(this.nameLength(password));
        this.freshColor();
      })

    TextInput({ placeholder: '重复密码' })
      .type(InputType.Password)
      .backgroundColor('#F4F6F5')
      .borderRadius(5)
      .onChange((repeatedPassword: string) => {
        this.changeRepeatedPassword(repeatedPassword);
        this.freshPasswordRepeatedInputIsEmpty(this.nameLength(repeatedPassword));
        this.freshColor();
      })
  }

  @Builder
  submitButtonBuilder(): void {
    Button('确定',{ type: ButtonType.Normal, stateEffect: this.signInButtonLight })
      .backgroundColor(this.getColor())
      .width('100%')
      .borderRadius(5)
      .onClick(() => {
        if (this.signInButtonLight && this.passwordInput == this.passwordRepeatedInput) {
          this.clearTip();
          this.user.password = this.passwordInput;
          this.pageInfos.pushPath({ name: 'ExchangePasswordSuccess' });
        } else if (this.signInButtonLight) {
          this.showTip();
        }
      })
  }

  @Builder
  topicBuilder(): void {
    Text('修改密码')
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

  @Builder
  errorTipBuilder(): void {
    Text('密码不一致')
      .fontColor(Color.Red)
      .margin({
        top: -230,
        left: -220
      })
      .fontSize(14)
      .opacity(this.tipOpacity)
  }
  @Builder
  contentBuilder(): void {
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
  build(): void {
    NavDestination() {
      Stack() {
        this.contentBuilder();
        this.errorTipBuilder();
      }

    }
    .hideBackButton(true)

  }
}
