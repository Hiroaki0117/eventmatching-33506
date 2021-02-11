require 'rails_helper'

RSpec.describe Event, type: :model do
  describe '#create' do
    before do
      @event = FactoryBot.build(:event)
    end
    context 'ユーザーイベントを投稿できる場合' do
      it "全ての入力が正しい場合は登録できる" do
        expect(@event).to be_valid
      end
    end

    context 'ユーザーがイベントを投稿できない場合' do
      it "イベント名が空では登録できない" do
        @event.name = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("イベント名を入力してください")
      end
      it "画像が空では登録できない" do
        @event.image = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("画像を入力してください")
      end
      it "イベント内容が空では登録できない" do
        @event.explanation = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("イベント内容を入力してください")
      end
      it "イベントジャンルのidが1だと登録できない" do
        @event.genre_id = 1
        @event.valid?
        expect(@event.errors.full_messages).to include("イベントのジャンルを選択してください")
      end      
      it "イベントの日時が空だと登録できない" do
        @event.day = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("日時を入力してください")
      end
      it "イベントの開始時刻のidが1だと登録できない" do
        @event.start_time_id = 1
        @event.valid?
        expect(@event.errors.full_messages).to include("イベント開始時刻を選択してください")
      end
      it "イベントの終了時刻のidが1だと登録できない" do
        @event.end_time_id = 1
        @event.valid?
        expect(@event.errors.full_messages).to include("イベント終了時刻を選択してください")
      end
      it "イベントの予定人数が空だと登録できない" do
        @event.capacity = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("予定人数を入力してください")
      end
      it "イベントの都道府県のidが1だと登録できない" do
        @event.area_id = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("都道府県を選択してください")
      end
      it "イベントの開催場所が空だと登録できない" do
        @event.place = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("開催場所を入力してください")
      end
      it "紐づいているユーザーがいないと登録できない" do
        @event.user = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end