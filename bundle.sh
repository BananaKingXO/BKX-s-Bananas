read -p "Version: " version

echo "Checking mods metadata:"
grep -r ${version} mod/

read -p "Do you see ${version} in the above list? If not update your mods metadata. "

rm -rf artifacts/${version}
mkdir -p artifacts/${version}

cd datapack/
zip -r ../artifacts/${version}/BKXs-Bananas-${version}.zip data/ overlay_data_26_2/ overlay_data_1_21/ overlay_data_1_21_8/ pack.mcmeta pack.png
cp ../artifacts/${version}/BKXs-Bananas-${version}.zip ../artifacts/${version}/mod.zip
cd ../resource_pack
zip -r  ../artifacts/${version}/BKXs-Bananas-${version}-RP.zip *
zip -r ../artifacts/${version}/mod.zip assets/ overlay_assets_1_21/
cd ../mod
zip -r ../artifacts/${version}/mod.zip *
cd ../artifacts/${version}
mv mod.zip BKXs-Bananas-${version}.jar

cd ..