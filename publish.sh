rm -rf static
rm -rf docs


# bash get_web_page.txt

gssg --productionDomain https://realvincentyuan.github.io/Spacecraft


# gssg --url https://realvincentyuan.github.io/Spacecraft  --dest https://github.com/Realvincentyuan/Spacecraft

mv static docs

# git add --all ./
# git push origin main
