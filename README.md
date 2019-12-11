# Full Text Search for Oreilly Books
- オライリーのタイトルと目次でElasticsearchによる全文検索を試すことができます。
- スクレイピングに実行は個人の責任とします。スクレイピング先サーバに負荷をかけないよう配慮してください。

## Usage
- buildしてコンテナを起動する。
```
docker-compose build
docker-compose up
```

- appコンテナ内にログインして初期処理実行する。
```
docker-compose exec app bash
# コンテナ内で
init.sh
```

- スクレイピングタスク実行する。
```
# コンテナ内
bundle exec rake scraping:oreilly
```

- ローカルでフロントエンドアプリを起動する（開発環境で実行のみ可能）。
```
cd frontend
yarn dev
```
