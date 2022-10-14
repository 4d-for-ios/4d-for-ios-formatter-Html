package ___PACKAGE___

import android.view.View
import android.view.ViewGroup
import android.webkit.WebView
import android.widget.TextView
import androidx.databinding.BindingAdapter

@BindingAdapter("htmlText")
fun htmlText(view: TextView, htmlText: String?) {
    if (htmlText.isNullOrEmpty()) return

    val webView = WebView(view.context)
    webView.setPadding(view.paddingStart, view.paddingTop, view.paddingEnd, view.paddingBottom)
    webView.layoutParams = view.layoutParams
    webView.loadDataWithBaseURL(null, htmlText, "text/html", "utf-8", null)
    (view.parent as? ViewGroup)?.addView(webView)
    view.visibility = View.GONE
}
