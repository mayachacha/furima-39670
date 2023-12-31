require 'rails_helper'
RSpec.describe User, type: :model do

before do
  @user = FactoryBot.build(:user)
end



  describe 'ユーザー新規登録' do
    
    context '新規登録できるとき' do 
      it 'nicknameとemail、passwordとpassword_confirmation、last_name、first_name、last_name_kana、first_name_kanaが存在すれば登録できる' do
      expect(@user).to be_valid
    end
  end

    context '新規登録できないとき' do

    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
 
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
   end

  it 'last_nameは全角でなければ登録できない' do
    @user.last_name = 'test' 
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
  end

  it 'first_nameは全角でなければ登録できない' do
    @user.first_name = 'test' 
    @user.valid?
    expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters")
  end

  it 'last_name_kanaはカタカナでなければ登録できない' do
    @user.last_name_kana = 'test' 
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters")
  end

  it 'first_name_kanaはカタカナでなければ登録できない' do
    @user.first_name_kana = 'test' 
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters")
  end

  it 'emailは@を含まないと登録できない' do
    @user.email = 'testmail'
    @user.valid?
    expect(@user.errors.full_messages).to include("Email is invalid")
  end

  it 'passwordとpassword_confirmationが不一致では登録できない' do
    @user.password = '1234abcd'
    @user.password_confirmation = '1111abcd'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it 'passwordは英字のみでは登録できない' do
    @user.password = 'aaaaaaaa'
    @user.password_confirmation = 'aaaaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
  end

  it 'passwordは数字のみでは登録できない' do
    @user.password = '11111111'
    @user.password_confirmation = '11111111'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
  end
  
  it 'passwordは全角文字は登録できない' do
    @user.password = 'ABcdefg'
    @user.password_confirmation = 'ABcdefg'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
  end

  it '重複したメールアドレスは登録できない' do
    @user.save
    another_user = FactoryBot.build(:user, email: @user.email)
    another_user.valid?
    expect(another_user.errors.full_messages).to include('Email has already been taken')
  end


  it 'passwordが6文字未満では登録できない' do
    @user.password = 'abc12'
    @user.password_confirmation = 'abc12'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
  end

end
end
end