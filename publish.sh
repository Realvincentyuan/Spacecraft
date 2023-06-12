rm -rf static
rm -rf docs


bash get_web_page.sh

# gssg --productionDomain https://realvincentyuan.github.io/Spacecraft


mv static docs

# git add --all ./
# git push origin main
