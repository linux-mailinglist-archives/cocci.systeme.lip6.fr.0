Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9C8741C7
	for <lists+cocci@lfdr.de>; Thu, 25 Jul 2019 00:54:45 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x6OMsPAc006169;
	Thu, 25 Jul 2019 00:54:26 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 44A147797;
	Thu, 25 Jul 2019 00:54:25 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 77C69420D
 for <cocci@systeme.lip6.fr>; Wed, 24 Jul 2019 20:23:49 +0200 (CEST)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:541] (may be forged))
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x6OINld0022988
 for <cocci@systeme.lip6.fr>; Wed, 24 Jul 2019 20:23:48 +0200 (CEST)
Received: by mail-pg1-x541.google.com with SMTP id f25so21616802pgv.10
 for <cocci@systeme.lip6.fr>; Wed, 24 Jul 2019 11:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=message-id:mime-version:content-transfer-encoding:in-reply-to
 :references:subject:to:cc:from:user-agent:date;
 bh=/UTQACYWihs+D96UuX0GSdpYwsPs5H8hc15Sw9zwTZk=;
 b=Wvl4GBEqyyXdTe4u0bb1ApAIBbHmw53V4/SCd/PG9Hdm2RRbDxwGy/KcZW2mMIdi5a
 tpVV3GgCiX2Vy9+6tZqQYkL4DQVKkJdpNQZitry9DyjVa79VYejx92ybrBYjGgO0pCgA
 UBE74+Xcccczump72mYfNZ9Oh7H8HMvmSagws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version
 :content-transfer-encoding:in-reply-to:references:subject:to:cc:from
 :user-agent:date;
 bh=/UTQACYWihs+D96UuX0GSdpYwsPs5H8hc15Sw9zwTZk=;
 b=Vd1vaOm9oBxGrupQ+n8Q/p+lXRx8z7T8sYf/icIm3bF2EPdMnFC8smKsez3QTclNpT
 DTkNJd7kHTiMMAQc+mAbf7K+7gnSdkXdhVzzZPD44vYzEXGpqALxURVI9+9pq+QwDs75
 ShCBx4vDentlLwZHlNYVDOtwhK1x+tFxRZe+Ovc4D6TBlu64bCCGQZmNp3OWe5hR+9EW
 tzi6ae6xFM0fzPtUcMXQgMSjZ+g06lPuwPxF6NvXU9pAMshxhf9d2UHgjwkii2EdcDED
 OfzqfDauiH5sA2+Y91z2u9CH8ph5nQwe8kQaFHZx9MjrXaUBhDZLTM9xpROXGk3Vlc2P
 lDtg==
X-Gm-Message-State: APjAAAUtYkUpAbu4FpzeaeNqjeDNsuAyNa8ovnTiFmb8CRj8qobxvlka
 bEeMsIvgKuOkctvkSxy80yQ85g==
X-Google-Smtp-Source: APXvYqxE7IY+6hLQMkntNC/0nJx+QAa8wu/tGuTS6Mzp5neZx5a6cta2lYffYGzN4+PvPsCRBu0miQ==
X-Received: by 2002:aa7:9516:: with SMTP id b22mr12525506pfp.106.1563992627374; 
 Wed, 24 Jul 2019 11:23:47 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id i3sm50422950pfo.138.2019.07.24.11.23.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 11:23:46 -0700 (PDT)
Message-ID: <5d38a232.1c69fb81.f85f4.67e3@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <9b5d8470-dd6e-4358-141f-6b6c40774de1@web.de>
References: <20190723181624.203864-4-swboyd@chromium.org>
 <9b5d8470-dd6e-4358-141f-6b6c40774de1@web.de>
To: Gilles Muller <Gilles.Muller@lip6.fr>, Julia Lawall <Julia.Lawall@lip6.fr>,
        Markus Elfring <Markus.Elfring@web.de>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nicolas Palix <nicolas.palix@imag.fr>, cocci@systeme.lip6.fr,
        kernel-janitors@vger.kernel.org
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date: Wed, 24 Jul 2019 11:23:46 -0700
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 25 Jul 2019 00:54:26 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Wed, 24 Jul 2019 20:23:48 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
X-Mailman-Approved-At: Thu, 25 Jul 2019 00:54:22 +0200
Cc: Rob Herring <robh@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        linux-kernel@vger.kernel.org,
        Javier Martinez Canillas <javierm@redhat.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Mark Brown <broonie@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [Cocci] [PATCH v4 3/3] coccinelle: Add script to check for
	platform_get_irq() excessive prints
X-BeenThere: cocci@systeme.lip6.fr
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: <cocci.systeme.lip6.fr>
List-Unsubscribe: <https://systeme.lip6.fr/mailman/options/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=unsubscribe>
List-Archive: <https://systeme.lip6.fr/pipermail/cocci>
List-Post: <mailto:cocci@systeme.lip6.fr>
List-Help: <mailto:cocci-request@systeme.lip6.fr?subject=help>
List-Subscribe: <https://systeme.lip6.fr/mailman/listinfo/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

UXVvdGluZyBNYXJrdXMgRWxmcmluZyAoMjAxOS0wNy0yNCAwNjoxODozNSkKPiA+ICtAc2NyaXB0
OnB5dGhvbiBkZXBlbmRzIG9uIG9yZ0AKPiA+ICtwMSA8PCByLnAxOwo+ID4gK0BACj4gPiArCj4g
PiArY29jY2kucHJpbnRfbWFpbihwMSkKPiAKPiBXaWxsIGFuIGFkZGl0aW9uYWwgbWVzc2FnZSBi
ZSBoZWxwZnVsIGF0IHRoaXMgcGxhY2U/Cj4gCj4gCj4gV2lsbCBmdXJ0aGVyIHNvZnR3YXJlIGRl
dmVsb3BtZW50IGNvbnNpZGVyYXRpb25zIGJlY29tZSBtb3JlIGludGVyZXN0aW5nCj4gYWxzbyBh
cm91bmQgYSBjb250cmlidXRpb24gbGlrZSDigJxDb2NjaW5lbGxlOiBBZGQgYSBTbVBMIHNjcmlw
dCBmb3IKPiB0aGUgcmVjb25zaWRlcmF0aW9uIG9mIHJlZHVuZGFudCBkZXZfZXJyKCkgY2FsbHPi
gJ0/Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yNzQ0YTNmYy05ZTY3LTgxMTMtMWRk
OS00MzY2OWUwNjM4NmFAd2ViLmRlLwo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3BhdGNod29y
ay9wYXRjaC8xMDk1OTM3Lwo+IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE5LzcvMS8xNDUKPiBo
dHRwczovL3N5c3RlbWUubGlwNi5mci9waXBlcm1haWwvY29jY2kvMjAxOS1KdWx5LzAwNjA3MS5o
dG1sCj4gCgpEaWQgdGhpcyBwYXRjaCBldmVyIGdldCBtZXJnZWQ/IEl0IHNlZW1zIGJldHRlciB0
byBhbWVuZCB0aGF0IHBhdGNoCmluc3RlYWQgb2YgaW50cm9kdWNlIGFub3RoZXIgb25lLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQ29jY2kgbWFpbGlu
ZyBsaXN0CkNvY2NpQHN5c3RlbWUubGlwNi5mcgpodHRwczovL3N5c3RlbWUubGlwNi5mci9tYWls
bWFuL2xpc3RpbmZvL2NvY2NpCg==
