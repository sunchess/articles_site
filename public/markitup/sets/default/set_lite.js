myTextileSettings = {
    nameSpace:           "textile", // Useful to prevent multi-instances CSS conflict
    previewParserPath:   "/articles/preview",
    onShiftEnter:        {keepDefault:false, replaceWith:'\n\n'},
    markupSet: [
        {name:'Heading 2', key:'2', openWith:'h2(!(([![Class]!]))!). ', placeHolder:'Здесь ваш текст...' },
        {name:'Heading 3', key:'3', openWith:'h3(!(([![Class]!]))!). ', placeHolder:'Здесь ваш текст...' },
        {name:'Paragraph', key:'P', openWith:'p(!(([![Class]!]))!). '}, 
        {separator:'---------------' },
        {name:'Bold', key:'B', closeWith:'*', openWith:'*'}, 
        {name:'Italic', key:'I', closeWith:'_', openWith:'_'}, 
        {name:'Stroke through', key:'S', closeWith:'-', openWith:'-'}, 
        {separator:'---------------' },
        {name:'Bulleted list', openWith:'(!(* |!|*)!)'}, 
        {name:'Numeric list', openWith:'(!(# |!|#)!)'}, 
        {separator:'---------------' },
        {name:'Picture', replaceWith:'![![Source:!:http://]!]([![Alternative text]!])!'}, 
        {name:'Link', openWith:'"', closeWith:'([![Title]!])":[![Link:!:http://]!]', placeHolder:'Текст для ссылки...' },
        {separator:'---------------' },
        {name:'Quotes', openWith:'bq(!(([![Class]!]))!). '}, 
        {name:'Code', openWith:'@', closeWith:'@'}, 
        {separator:'---------------' },       
        {name:'Preview', call:'preview', className:'preview'}
    ]
}
