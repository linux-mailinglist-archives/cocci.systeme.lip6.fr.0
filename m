Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A80D741C6
	for <lists+cocci@lfdr.de>; Thu, 25 Jul 2019 00:54:44 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x6OMsOTs027922;
	Thu, 25 Jul 2019 00:54:24 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id C3D3E778D;
	Thu, 25 Jul 2019 00:54:24 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id ADC99420D
 for <cocci@systeme.lip6.fr>; Wed, 24 Jul 2019 20:21:59 +0200 (CEST)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20:0:0:0:629] (may be forged))
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x6OILvR8014498
 for <cocci@systeme.lip6.fr>; Wed, 24 Jul 2019 20:21:57 +0200 (CEST)
Received: by mail-pl1-x629.google.com with SMTP id i2so22342652plt.1
 for <cocci@systeme.lip6.fr>; Wed, 24 Jul 2019 11:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=message-id:mime-version:content-transfer-encoding:in-reply-to
 :references:subject:to:cc:from:user-agent:date;
 bh=STM42I/99+hliAUzw485JNYg3BolU1kKr1GKH8Q1t9I=;
 b=IWAnfb2ugCtB1EBhfQSgHsGQsUEsxIqW7A7ukiDBQvQT5Me0WMINTtmbfEzCHy0wc4
 I3Y6tctNtmhFT8lD70VthrwItZZw3HgLyfzMucpvqm5hEPoKxBVuOktErIXGlOUIUzsm
 pxk83Ri/IIHLUxYTSWGkZz2k0uoYv5nMp12tY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version
 :content-transfer-encoding:in-reply-to:references:subject:to:cc:from
 :user-agent:date;
 bh=STM42I/99+hliAUzw485JNYg3BolU1kKr1GKH8Q1t9I=;
 b=rkzxRSI8WmEtp8VNHYQoSL+JqZcZqIGSTgQZWb626NIZsqjKeUiwa6fd0yYqZ1CoDB
 ZyJlqyPXsbwwX6RXTESYK0GXakOW+uOCMovJJz8Ryg0qgKA0crdr6AjuFbDnjP8zThIw
 mx22A8fwg72kU8RjUTgBFbQ2KZOoqEYD92h1O2hXYk7lNYHvXvWw74Fp/5fzfiUbacSl
 fHOHTU8+UNA6h8MDuT7PgIrsXx5R6IdXgZg7D1Jot99xzGOVboSBLScPGRyPpZlpqrIK
 UgSeKnN4BxgJMGDnxy4QMYAn5fhJjozQjpRYApVjWXfHEwBzsNZJYluJT3yeVrx/Xm2Y
 jIvQ==
X-Gm-Message-State: APjAAAXJcvVDtPF22E6yV6JpIoZkhfCd/WxCxisxMHRYwWVemgTRgXbC
 RFZbAizZqrIPieAP8ctGQb+8ww==
X-Google-Smtp-Source: APXvYqwHS2YQ0e8I05dRILy8sF+cOXkqamKTErem/TXY2mRfrUuw1ajiREW82Lm7aKcyrNj9x3L0Cg==
X-Received: by 2002:a17:902:be03:: with SMTP id
 r3mr88009941pls.156.1563992516692; 
 Wed, 24 Jul 2019 11:21:56 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id e6sm53313708pfn.71.2019.07.24.11.21.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 11:21:55 -0700 (PDT)
Message-ID: <5d38a1c3.1c69fb81.2b26a.b585@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <c98b8f50-1adf-ea95-a91c-ec451e9fefe2@web.de>
References: <20190723181624.203864-4-swboyd@chromium.org>
 <c98b8f50-1adf-ea95-a91c-ec451e9fefe2@web.de>
To: Markus Elfring <Markus.Elfring@web.de>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nicolas Palix <nicolas.palix@imag.fr>, cocci@systeme.lip6.fr,
        kernel-janitors@vger.kernel.org
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date: Wed, 24 Jul 2019 11:21:54 -0700
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 25 Jul 2019 00:54:24 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [IPv6:2001:660:3302:283c:0:0:0:2]);
 Wed, 24 Jul 2019 20:21:57 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78
X-Mailman-Approved-At: Thu, 25 Jul 2019 00:54:22 +0200
Cc: Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

Quoting Markus Elfring (2019-07-24 02:30:16)
> I would prefer to concentrate the usage of SmPL disjunctions on changing
> implementation details so that the specification of duplicate code
> can be avoided.
> 
> 
> > +(
> > +platform_get_irq(E, ...)
> > +|
> > +platform_get_irq_byname(E, ...)
> > +);
> 
> Function names:
> 
> +(platform_get_irq
> +|platform_get_irq_byname
> +)(E, ...);
> 
> 
> > +if ( \( ret < 0 \| ret <= 0 \) )
> 
> Comparison operators:
> 
> +if (ret \( < \| <= \) 0)
> 

Thanks. Will fold the above two in.

> 
> > +if (ret != -EPROBE_DEFER)
> 
> Is it appropriate to treat this error code check as optional
> by the shown transformation approach?
> Can this case distinction be omitted?

I don't know what you mean here. Do you want me to drop this part so
that EPROBE_DEFER checks don't get removed?

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
