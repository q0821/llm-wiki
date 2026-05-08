#!/usr/bin/env bash
# inbox-pull.sh
# 把 iCloud inbox vault 累積的素材搬進專案的 raw/。
# - markdown / 文字檔 → raw/
# - 其他附件（圖片、PDF 等） → raw/assets/
# - 衝突時加時間戳後綴，不覆蓋既有檔
# - 跳過 .DS_Store / .obsidian/ / README.md
# - 把 iCloud .icloud 占位符先強制下載再搬
#
# 環境變數：
#   INBOX  — inbox vault 路徑（預設指向 iCloud Obsidian wiki-inbox）
#   RAW    — 專案 raw/ 路徑（預設依腳本所在位置往上一層算）

set -euo pipefail
shopt -s nocasematch  # 副檔名比對不分大小寫（兼容 bash 3.2）

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

INBOX="${INBOX:-$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/wiki-inbox}"
RAW="${RAW:-$PROJECT_ROOT/raw}"
ASSETS="$RAW/assets"

log() { printf '[inbox-pull] %s\n' "$*"; }
warn() { printf '[inbox-pull] %s\n' "$*" >&2; }

if [[ ! -d "$INBOX" ]]; then
  warn "inbox 不存在：$INBOX（跳過）"
  exit 0
fi

if [[ ! -d "$RAW" ]]; then
  warn "raw/ 不存在：$RAW"
  exit 1
fi

mkdir -p "$ASSETS"

# 1) 強制下載 iCloud 占位符（檔名為 .xxx.icloud）
while IFS= read -r -d '' placeholder; do
  brctl download "$placeholder" >/dev/null 2>&1 || true
done < <(find "$INBOX" -name "*.icloud" -print0 2>/dev/null)

# 2) 搬移檔案
moved=0
conflicts=0

while IFS= read -r -d '' src; do
  filename="$(basename "$src")"

  # 跳過系統 / vault 設定 / 說明檔
  case "$filename" in
    .DS_Store|.gitkeep) continue ;;
    README.md|README) continue ;;
  esac

  # 路徑包含 .obsidian/ 一律跳過
  case "$src" in
    *"/.obsidian/"*) continue ;;
  esac

  # 決定目的地（markdown / txt → raw/，其他 → raw/assets/）
  case "$filename" in
    *.md|*.markdown|*.txt|*.MD|*.MARKDOWN|*.TXT) dest_dir="$RAW" ;;
    *) dest_dir="$ASSETS" ;;
  esac

  dest="$dest_dir/$filename"

  # 衝突 → 加時間戳
  if [[ -e "$dest" ]]; then
    base="${filename%.*}"
    ext="${filename##*.}"
    if [[ "$base" == "$filename" ]]; then
      ext=""
      base="$filename"
    fi
    suffix="$(date +%Y%m%d-%H%M%S)"
    if [[ -n "$ext" ]]; then
      dest="$dest_dir/${base}-${suffix}.${ext}"
    else
      dest="$dest_dir/${base}-${suffix}"
    fi
    log "衝突：$filename → $(basename "$dest")"
    conflicts=$((conflicts + 1))
  fi

  mv "$src" "$dest"
  log "搬入：$(basename "$dest")  ($(dirname "$dest" | sed "s|$PROJECT_ROOT/||"))"
  moved=$((moved + 1))
done < <(find "$INBOX" -type f \
  -not -path "*/.obsidian/*" \
  -not -name ".DS_Store" \
  -not -name "*.icloud" \
  -print0)

# 3) 清理 inbox 內可能殘留的空子目錄（不動 .obsidian/）
find "$INBOX" -mindepth 1 -type d \
  -not -path "*/.obsidian*" \
  -empty -delete 2>/dev/null || true

if [[ "$moved" -eq 0 ]]; then
  log "inbox 沒有新素材"
else
  log "完成：搬入 $moved 個檔案（衝突 $conflicts 個）"
fi
