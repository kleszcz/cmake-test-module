function(target_test_me)
    cmake_parse_arguments(
        parsed      # prefix for parsed keywords; access keywords: ${prefix_keyword}
        "TEST"          # options - ON or OFF ex: USE_STATIC is aprsed to ${parsed_USE_STATIC} and has value OFF by default
        "TARGET"    # one-value keypair ex: TARGET target_name; DESTINATIO path; etc.
        "FILES"          # multi-value keywords ex: TARGETS foo bar; FILES a.cpp b.cpp c.cpp; TRAGETS foo bar parses to ${parsed_TARGETS} = foo;bar
        ${ARGN}     # actual string we're parsing
    )
    if(parsed_UNPARSED_ARGUMENTS)
        message(FATAL_ERROR "Bad arguments: ${parsed_UNPARSED_ARGUMENTS}")
    endif()
    if(parsed_KEYWORDS_MISSING_VALUES)
        message(WARNING "Keywords missing values: ${parsed_KEYWORDS_MISSING_VALUES}")
    endif()
    set(target ${parsed_TARGET})
    set(files ${parsed_FILES})
    set(test ${parsed_TEST})
    message(VERBOSE "Tested ${target}")
    message(VERBOSE "Files passed: ${files}")
    message(VERBOSE "Test is: ${test} (If it's ON expect original arguments)")
    if(test)
        message(VERBOSE "Original arguments: ${ARGN}")
    endif()
endfunction()