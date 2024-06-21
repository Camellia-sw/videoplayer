file(REMOVE_RECURSE
  "video/Actions.qml"
  "video/Content.qml"
  "video/CusDragRect.qml"
  "video/Dialogs.qml"
  "video/Footer.qml"
  "video/Main.qml"
  "video/PlayerList.qml"
  "video/images.qrc"
  "video/screenshot.qml"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/appvideo_tooling.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
