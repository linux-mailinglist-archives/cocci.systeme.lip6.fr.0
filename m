Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9FCE89B0
	for <lists+cocci@lfdr.de>; Tue, 29 Oct 2019 14:38:53 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9TDcd1r009463;
	Tue, 29 Oct 2019 14:38:39 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 0E95377CC;
	Tue, 29 Oct 2019 14:38:39 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 9EC7A454C
 for <cocci@systeme.lip6.fr>; Tue, 29 Oct 2019 14:38:37 +0100 (CET)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9TDcbdt029075
 for <cocci@systeme.lip6.fr>; Tue, 29 Oct 2019 14:38:37 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.68,244,1569276000"; d="scan'208";a="409343048"
Received: from unknown (HELO hadrien) ([91.217.168.176])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Oct 2019 14:38:37 +0100
Date: Tue, 29 Oct 2019 14:38:36 +0100 (CET)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: julia@hadrien
To: Masahiro Yamada <yamada.masahiro@socionext.com>
In-Reply-To: <CAK7LNAQ8Wi1zED0rYJhk9tYi5-jgCoyeHNtofvgKet4ZTzKFcA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.1910291437450.2179@hadrien>
References: <CAK7LNAQ8Wi1zED0rYJhk9tYi5-jgCoyeHNtofvgKet4ZTzKFcA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 29 Oct 2019 14:38:39 +0100 (CET)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Tue, 29 Oct 2019 14:38:37 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Matthias Maennich <maennich@google.com>,
        Coccinelle <cocci@systeme.lip6.fr>, Jessica Yu <jeyu@kernel.org>
Subject: Re: [Cocci] Warning message from 'make nsdeps' when namespace is
 lower cases
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



On Tue, 29 Oct 2019, Masahiro Yamada wrote:

> Hi.
>
> When I was playing with 'make nsdeps',
> I saw a new warning.
>
> If I rename USB_STORAGE to usb_storage,
> I see 'warning: line 15: should usb_storage be a metavariable?'
> Why? I think it comes from spatch.

Yes, it would come from spatch.

> It should be technically OK to use either upper or lower cases
> for the namespace name.

What is normally wanted?  Uppercase or lowercase?

julia

>
> Just apply the following, and try 'make nsdeps'.
>
>
> diff --git a/drivers/usb/storage/Makefile b/drivers/usb/storage/Makefile
> index 46635fa4a340..6f817d65c26b 100644
> --- a/drivers/usb/storage/Makefile
> +++ b/drivers/usb/storage/Makefile
> @@ -8,7 +8,7 @@
>
>  ccflags-y := -I $(srctree)/drivers/scsi
>
> -ccflags-y += -DDEFAULT_SYMBOL_NAMESPACE=USB_STORAGE
> +ccflags-y += -DDEFAULT_SYMBOL_NAMESPACE=usb_storage
>
>  obj-$(CONFIG_USB_UAS)          += uas.o
>  obj-$(CONFIG_USB_STORAGE)      += usb-storage.o
>
>
>
>
>
>
>
>
>
>
> --
> Best Regards
> Masahiro Yamada
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
