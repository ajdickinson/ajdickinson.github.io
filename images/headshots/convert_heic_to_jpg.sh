counter=1

for file in IMG_*.heic; do
  # Replace four numbers between "IMG_" and ".HEIC" with counter
  renamed_file=$(echo $file | sed -E 's/(IMG_)[0-9]{4}(.heic)/\1'"${counter}"'\2/g')

  # Convert to JPG
  heif-convert $file "${renamed_file/%.heic/.jpg}"

  # Increment counter
  ((counter++))
done
