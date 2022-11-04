function (convert_image TARGET IMAGE)
    add_custom_command(
        OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/../modules/${IMAGE}.py
        
        COMMAND
            cd ${CMAKE_CURRENT_LIST_DIR}/assets && python3 ../../../../examples/badger2040/image_converter/convert.py --out_dir ${CMAKE_CURRENT_BINARY_DIR}/../modules --py ${IMAGE}.png

        DEPENDS ${CMAKE_CURRENT_LIST_DIR}/assets/${IMAGE}.png
    )
    target_sources(${TARGET} INTERFACE ${CMAKE_CURRENT_BINARY_DIR}/../modules/${IMAGE}.py)
endfunction()

function (convert_gh_qr TARGET IMAGE)
    add_custom_command(
        OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/../modules/${IMAGE}.py
        
        COMMAND
            cd ${CMAKE_CURRENT_LIST_DIR}/assets && python3 ../../../../examples/badger2040/image_converter/convert.py --qr_resize --out_dir ${CMAKE_CURRENT_BINARY_DIR}/../modules --py ${IMAGE}.png

        DEPENDS ${CMAKE_CURRENT_LIST_DIR}/assets/${IMAGE}.png
    )
    target_sources(${TARGET} INTERFACE ${CMAKE_CURRENT_BINARY_DIR}/../modules/${IMAGE}.py)
endfunction()

function (convert_raw TARGET SRC DST)
    add_custom_command(
        OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/../modules/${DST}.py
        
        COMMAND
            cd ${CMAKE_CURRENT_LIST_DIR}/assets && python3 ../../../../examples/badger2040/image_converter/data_to_py.py ${CMAKE_CURRENT_LIST_DIR}/assets/${SRC} ${CMAKE_CURRENT_BINARY_DIR}/../modules/${DST}.py

        DEPENDS ${CMAKE_CURRENT_LIST_DIR}/assets/${SRC}
    )
    target_sources(${TARGET} INTERFACE ${CMAKE_CURRENT_BINARY_DIR}/../modules/${DST}.py)
endfunction()

function (copy_module TARGET SRC DST)
    add_custom_command(
        OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/../modules/${DST}.py

        COMMAND
            cp ${SRC} ${CMAKE_CURRENT_BINARY_DIR}/../modules/${DST}.py

        DEPENDS ${SRC}
    )

    target_sources(${TARGET} INTERFACE ${CMAKE_CURRENT_BINARY_DIR}/../modules/${DST}.py)
endfunction()

convert_image(usermod_badger2040 badge_image)
convert_image(usermod_badger2040 badgerpunk)
convert_image(usermod_badger2040 launchericons)
convert_gh_qr(usermod_badger2040 gh_qrcode)

convert_raw(usermod_badger2040 289-0-wind-in-the-willows-abridged.txt witw)
convert_raw(usermod_badger2040 contribution_page_1.txt contribution_page_1)
convert_raw(usermod_badger2040 contribution_page_2.txt contribution_page_2)


copy_module(usermod_badger2040 ${CMAKE_CURRENT_LIST_DIR}/assets/boot.py boot)
copy_module(usermod_badger2040 ${CMAKE_CURRENT_LIST_DIR}/launcher.py _launcher)
copy_module(usermod_badger2040 ${CMAKE_CURRENT_LIST_DIR}/clock.py _clock)
copy_module(usermod_badger2040 ${CMAKE_CURRENT_LIST_DIR}/fonts.py _fonts)
copy_module(usermod_badger2040 ${CMAKE_CURRENT_LIST_DIR}/ebook.py _ebook)
copy_module(usermod_badger2040 ${CMAKE_CURRENT_LIST_DIR}/image.py _image)
copy_module(usermod_badger2040 ${CMAKE_CURRENT_LIST_DIR}/list.py _list)
copy_module(usermod_badger2040 ${CMAKE_CURRENT_LIST_DIR}/badge.py _badge)
copy_module(usermod_badger2040 ${CMAKE_CURRENT_LIST_DIR}/help.py _help)
copy_module(usermod_badger2040 ${CMAKE_CURRENT_LIST_DIR}/info.py _info)
copy_module(usermod_badger2040 ${CMAKE_CURRENT_LIST_DIR}/qrgen.py _qrgen)
copy_module(usermod_badger2040 ${CMAKE_CURRENT_LIST_DIR}/contribution_graph.py contribution_graph)
copy_module(usermod_badger2040 ${CMAKE_CURRENT_LIST_DIR}/badger_os.py badger_os)
