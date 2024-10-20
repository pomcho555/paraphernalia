#!/bin/bash -e

# Usage: ./bulk_epub2pdf.sh $EPUB_DIR
# The epub directory must follow this definition: https://www.w3.org/TR/epub-33/

find . -name "*.epub" -print0 | while IFS= read -r -d '' file; do
	filename=${file##*/}
	echo $filename
	target_dir=$(echo $(dirname "$file") | sed -e 's/[()]/\\&/g' -e 's/ /\\ /g')
	echo "target $target_dir"
	eval cd "${target_dir}"
	#echo "ebook-convert $escaped ./pdfs/${filename%.epub}.pdf"
	if [ ! -f ./${filename%.epub}.pdf ]; then
    echo "doesn't"
		#/opt/homebrew/bin/ebook-convert "${filename}" "./${filename%.epub}.pdf"
	fi
  echo "Done ${filename}"
	cd ..
done
