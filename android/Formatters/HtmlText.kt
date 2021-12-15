package ___PACKAGE___

import android.os.Build
import android.text.Html
import android.widget.TextView
import androidx.core.text.HtmlCompat
import androidx.databinding.BindingAdapter

@BindingAdapter("htmlText")
fun htmlText(view: TextView, htmlText: String?) {
    if (htmlText.isNullOrEmpty()) return
    view.text = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
        Html.fromHtml(htmlText, Html.FROM_HTML_MODE_COMPACT)
    } else {
        HtmlCompat.fromHtml(htmlText, HtmlCompat.FROM_HTML_MODE_LEGACY)
    }
}
