file(REMOVE_RECURSE
  "video/Actions.qml"
  "video/BarrageDelegate.qml"
  "video/Content.qml"
  "video/Dialogs.qml"
  "video/Footer.qml"
  "video/Main.qml"
  "video/PlayerList.qml"
  "video/images.qrc"
  "video/video.js"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/appvideo_tooling.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
