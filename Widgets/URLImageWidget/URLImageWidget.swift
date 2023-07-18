// The MIT License (MIT)
//
// Copyright (c) 2020-Present Paweł Wiszenko
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import SwiftUI
import WidgetKit

struct URLImageWidget: Widget {
    private let kind: String = WidgetType.urlImage.kind

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) {
            EntryView(entry: $0)
        }
        .configurationDisplayName("URLImage Widget")
        .description("A Widget that displays an Image downloaded from an external URL and caches it.")
        .supportedFamilies([.systemSmall])
    }
}

// MARK: - Preview

#Preview(as: .systemSmall) {
    URLImageWidget()
} timeline: {
    URLImageWidget.Entry(image: .notRequested)
    URLImageWidget.Entry(image: .isLoading)
    URLImageWidget.Entry(image: .loaded(value: Image(systemName: "photo")))
    URLImageWidget.Entry(image: .cached(value: Image(systemName: "photo")))
    URLImageWidget.Entry(image: .failed(error: "Error"))
}
