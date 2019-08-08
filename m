Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5F385C6A
	for <lists+cocci@lfdr.de>; Thu,  8 Aug 2019 10:04:00 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x7883QgN024337;
	Thu, 8 Aug 2019 10:03:26 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id DEF687795;
	Thu,  8 Aug 2019 10:03:25 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 50D997786
 for <cocci@systeme.lip6.fr>; Thu,  8 Aug 2019 09:51:34 +0200 (CEST)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x787pXZG027503
 for <cocci@systeme.lip6.fr>; Thu, 8 Aug 2019 09:51:33 +0200 (CEST)
Received: by mail-ot1-f66.google.com with SMTP id s20so49508419otp.4
 for <cocci@systeme.lip6.fr>; Thu, 08 Aug 2019 00:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0zYvO8kgva/HCROTu3alVTGHgN2aevAEIYRY7aUYyOU=;
 b=WTiBd9gbFJpUrcMtekDVS1pDrBNV1KLHDWwaUa/y8whXJC3oc4kEsPsQMDNKY16TRl
 miam5cJArjgE5K7M5qg+SlIGECX70pzMpgs0QiZd4xXuO6SCOiRGHfPdAqx0RJVbg/PU
 zpD+m8nbLhSwVQcjWOEPLc6tc+ov/UnpP1Ws9PAVYi+SEUhycRingYKwtD8AYBJ9DVJq
 Y9eLzhjtNsYwW+DRSI8+PNKRsISg8IQe+wUU/RnR9shpozxy8ooo8AQmrN5nqHTbzM+f
 PoTxFMSlLUf9xZqfJDu151XJugxYcWkZoOoprrQkMmMSxtUWhmA12tIO4MtRXvxWQ6vp
 Xyqw==
X-Gm-Message-State: APjAAAXqv6Bvj1shlhswZ9OTlvZKZP+yT/Yg+Ackkh+lGmagjcYCqndY
 6sU8l+9FAIK58j0BmUcdtIMK5FADF3+vpbwr/YY=
X-Google-Smtp-Source: APXvYqwszIoNMVOKBwYp3aP3PPfCWFyxZCZa0aiTnpVpNAVmxKQDAkd6Dd55mIi8FsWP4N0IeISzw4KkePpuqLzoi4k=
X-Received: by 2002:a9d:529:: with SMTP id 38mr12029150otw.145.1565250693148; 
 Thu, 08 Aug 2019 00:51:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190730053845.126834-1-swboyd@chromium.org>
 <20190731142645.GA1680@kunai>
 <5d41ab2c.1c69fb81.6129.661f@mx.google.com> <20190801122559.GC1659@ninjato>
In-Reply-To: <20190801122559.GC1659@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Aug 2019 09:51:22 +0200
Message-ID: <CAMuHMdW5QHvr=a1MXzqyCoYc2FC-4tKB-AbhTZQG=etbq=vmAQ@mail.gmail.com>
To: Wolfram Sang <wsa@the-dreams.de>
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 08 Aug 2019 10:03:27 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 08 Aug 2019 09:51:34 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Mailman-Approved-At: Thu, 08 Aug 2019 10:03:23 +0200
Cc: Rob Herring <robh@kernel.org>, Michal Marek <michal.lkml@markovi.net>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Javier Martinez Canillas <javierm@redhat.com>, cocci@systeme.lip6.fr,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [Cocci] [PATCH v5 0/3] Add error message to platform_get_irq*()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

Hi Wolfram,

On Thu, Aug 1, 2019 at 3:13 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> > these drivers pop up, I think we can have another function like
> > platform_get_irq_probe() or platform_get_irq_nowarn() that doesn't print
> > an error message. Then we can convert the drivers that are poking around
> > for interrupts to use this new function instead. It isn't the same as a
> > platform_get_optional_irq() API because it returns an error when the irq
> > isn't there or we fail to parse something, but at least the error
> > message is gone.
>
> True.
>
> I still feel uneasy about pushing false positive error messages to
> users. Do you think your cocci-script could be updated to modify drivers
> which do not bail out when platform_get_irq() fails to use
> platform_get_irq_nowarn()? I'd think this would catch most of them?
>
> Or maybe the other way around? platform_get_irq_warn() and only convert
> those which print something?

Following clk, gpio, regulator, and reset, the functions should be called
platform_get_irq() and platform_get_irq_optional().

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
