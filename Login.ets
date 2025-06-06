import Register from './Register'
import FindPassword from './FindPassword'
import ExchangePassword from './ExchangePassword';
import ExchangePasswordSuccess from './ExchangePasswordSuccess';
import RegisterSuccess from './RegisterSuccess';
import MainPage from '../MainPage';
import CourseContent from '../CourseContent';
import InterestTags from '../InterestTags';
import EditProfile from '../EditProfile';
import VerificationCode from './VerificationCode';

export class User {
  name: string;
  password: string;
  UID: number;
  Nickname: string = '';
  constructor(name: string, password: string, uid: number) {
    this.name = name;
    this.password = password;
    this.UID = uid;
  }
}

@Entry
@Component
struct Login {
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack()
  @State signInButtonColor: string = '#F1A1AC';
  @State signInButtonLight: boolean = false;
  @State usernameInputIsEmpty: boolean = true;
  @State PasswordInputIsEmpty: boolean = true;
  @State user: User = new User('10', '123456', 123456);
  @State newUser: User = new User('Admin', 'Admin', 0);
  @State currentUser: User = this.user;
  @State username: string = '';
  @State password: string = '';
  @State tipOpacity: number = 0
  @State verificationCode: number = 0;

  changeUsername(username: string): void {
    this.username = username;
  }
  changePassword(password: string): void {
    this.password = password;
  }
  showTip(): void {
    this.tipOpacity = 1;
  }
  clearTip(): void {
    this.tipOpacity = 0;
  }

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
  freshPasswordInputIsEmpty(input: boolean): void {
    this.PasswordInputIsEmpty = input;
  }
  freshColor(): void {
    let empty: boolean = this.usernameInputIsEmpty || this.PasswordInputIsEmpty;
    this.signInButtonLight = (empty == false);
  }
  getColor(): string {
    let color: string = '#F1A1AC';
    if (this.signInButtonLight) {
      color = '#EC697B';
    }
    return color;
  }
  signInPressed(): void {
    let loginSuccess: boolean = false;
    if (this.username == this.user.name && this.password == this.user.password) {
      loginSuccess = true;
    } else if (this.username == this.newUser.name && this.password == this.newUser.password) {
      loginSuccess = true;
      this.currentUser = this.newUser;
    }
    if (loginSuccess) {
      this.clearTip();
      this.pageInfos.pushPath({ name: 'MainPage' })
    } else if (this.signInButtonLight) {
      this.showTip()
    }
  }

  @Builder
  PageMap(name: string): void {
    if (name === "Register") {
      Register({ user: this.newUser, verificationCode: this.verificationCode });
    } else if (name === "ForgetPassword") {
      FindPassword({ verificationCode: this.verificationCode });
    } else if (name === "ExchangePassword") {
      ExchangePassword({ user: this.currentUser });
    } else if (name === "ExchangePasswordSuccess") {
      ExchangePasswordSuccess();
    } else if (name === "RegisterSuccess") {
      RegisterSuccess();
    } else if (name === "MainPage") {
      MainPage({ user: this.currentUser });
    } else if (name === "CourseContent") {
      CourseContent();
    } else if (name === "InterestTags") {
      InterestTags();
    } else if (name === "EditProfile") {
      EditProfile({ user: this.currentUser });
    } else if (name === "VerificationCode") {
      VerificationCode({ verificationCode: this.verificationCode });
    }
  }
  @Builder
  logoBuilder(): void {
    Row() {
      Image($rawfile('logo/iSoftStone_logo.png'))
        .width('50%')
        .margin({
          left: 10,
          top: -20
        })
    }
    .width('100%')
  }
  @Builder
  topicBuilder(): void {
    Text('通鸿云课堂')
      .fontColor('#EC697B')
      .fontSize(30)
      .fontWeight(FontWeight.Bold)
      .letterSpacing(2)
  }
  @Builder
  signBUilder(): void {
    TextInput({ placeholder: '手机号/用户名/邮箱' })
      .type(InputType.Normal)
      .backgroundColor('#F4F6F5')
      .borderRadius(5)
      .onChange((username: string) => {
        this.changeUsername(username);
        this.freshUsernameInputIsEmpty(this.nameLength(username));
        this.freshColor();
      })

    TextInput({ placeholder: '密码' })
      .type(InputType.Password)
      .backgroundColor('#F4F6F5')
      .borderRadius(5)
      .onChange((password: string) => {
        this.changePassword(password);
        this.freshPasswordInputIsEmpty(this.nameLength(password));
        this.freshColor();
      })
  }
  @Builder
  signInButtonBuilder(): void {
    Button('Sign In',{ type: ButtonType.Normal, stateEffect: this.signInButtonLight })
      .backgroundColor(this.getColor())
      .width('100%')
      .borderRadius(5)
      .onClick(() => {
        this.signInPressed();
      })
  }
  @Builder
  optionBuilder(): void {
    Row() {
      Text('忘记密码')
        .fontColor('#6C96E5')
        .fontSize(14)
        .onClick(() => {
          this.pageInfos.pushPath({ name: "ForgetPassword" });
        })

      Text('快速注册')
        .fontColor('#6C96E5')
        .fontSize(14)
        .onClick(() => {
          this.pageInfos.pushPath({ name: "Register" });
        })
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
  }
  @Builder
  contentBuilder(): void {
    Column({ space: 30 }) {
      this.topicBuilder()
      this.signBUilder()
      this.signInButtonBuilder()
      this.optionBuilder()
    }
    .justifyContent(FlexAlign.Center)
    .height('90%')
    .width('85%')
    .margin({
      bottom: -40
    })
  }
  @Builder
  errorTipBuilder(): void {
    Text('用户名或密码错误')
      .fontColor(Color.Red)
      .margin({
        bottom: -130,
        left: -200
      })
      .fontSize(14)
      .opacity(this.tipOpacity)
  }
  @Builder
  bodyBuilder(): void {
    Stack() {
      this.contentBuilder()
      this.errorTipBuilder()
    }
  }
  @Builder
  otherLoginBuilder(): void {
    Row() {
      Divider()
        .width('20%')
        .color('#CFCFCF')
        .strokeWidth(1)
      Text('第三方登录')
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

    Row({ space: 30 }) {
      Image($rawfile('logo/weixin.png')).width(32).height(32)
      Image($rawfile('logo/qq.png')).width(32).height(32)
      Image($rawfile('logo/dingding.png')).width(32).height(32)
    }
    .width('100%')
    .justifyContent(FlexAlign.Center)
    .margin({
      top: 10
    })
  }

  @Builder
  main(): void {
    this.logoBuilder()
    this.bodyBuilder()
    this.otherLoginBuilder();
  }

  build(): void {
    Navigation(this.pageInfos) {
      this.main()
    }
    .mode(NavigationMode.Stack)
    .navDestination(this.PageMap)
    .height('100%')
    .width('100%')
    .backgroundColor(Color.White)
  }
}