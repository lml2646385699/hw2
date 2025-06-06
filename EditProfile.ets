import { User } from './Login/Login'
@Component
export default struct EditProfile {
  private avatars: string[] = [
    'images/头像1.svg',
    'images/头像2.svg',
    'images/头像3.svg'
  ];
  @Consume('pageInfos') pageInfos: NavPathStack;
  @State currentAvatarIndex: number = 0;
  @State editNickname: string = '';
  @Link user: User;

  changeNickname(input: string) {
    this.editNickname = input;
  }
  updateUserInfo(user: User, nickname: string) {
    user.Nickname = nickname;
  }
  @Builder
  editProfileBuilder() {
    Column() {
      // 头像轮播
      Image($rawfile(this.avatars[this.currentAvatarIndex]))
        .width(80)
        .height(80)
        .margin({ bottom: 20 })
        .onClick(() => {
          this.currentAvatarIndex = (this.currentAvatarIndex + 1) % this.avatars.length;
        });

      // UID 输入框
      Row() {
        Text('昵称:').fontSize(18);
        TextInput({ placeholder: '请输入昵称', text: this.editNickname })
          .fontSize(18)
          .onChange((value: string) => {
            this.changeNickname(value);
          });
      }
      .margin({ bottom: 20 });

      // 保存按钮
      Button('保存')
        .width(120)
        .height(40)
        .backgroundColor('#4F8EF7')
        .fontSize(18)
        .onClick(() => {
          this.updateUserInfo(this.user, this.editNickname);
          this.pageInfos.pop();
        });
    }
    .width('100%')
    .height('100%')
    .padding(32)
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#FFF')
  }
  build() {
    NavDestination() {
      this.editProfileBuilder();
    }
  }
}