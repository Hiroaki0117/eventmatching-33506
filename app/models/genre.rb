class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'サッカー' },
    { id: 3, name: '野球' },
    { id: 4, name: 'バスケットボール' },
    { id: 5, name: 'バレーボール' },
    { id: 6, name: 'バドミントン' },
    { id: 7, name: 'テニス' },
    { id: 8, name: '卓球' },
    { id: 9, name: '水泳' },
    { id: 10, name: 'ランニング' },
    { id: 11, name: 'ドッヂボール' },
    { id: 12, name: 'スノーボード/スキー' },
    { id: 13, name: 'サイクリング' },
    { id: 14, name: '鬼ごっこ' },
    { id: 15, name: '食事' },
    { id: 16, name: '飲み会' },
    { id: 17, name: 'ライブ/フェス' },
    { id: 18, name: 'ショッピング' },
    { id: 19, name: 'その他'}
  ]

  include ActiveHash::Associations
  has_many :events
  end