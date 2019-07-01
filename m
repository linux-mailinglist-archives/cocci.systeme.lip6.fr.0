Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4304FA9F
	for <lists+cocci@lfdr.de>; Sun, 23 Jun 2019 09:35:56 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5N7ZKN3026404;
	Sun, 23 Jun 2019 09:35:20 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id B48D1777B;
	Sun, 23 Jun 2019 09:35:20 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 2866F7761
 for <cocci@systeme.lip6.fr>; Sun, 23 Jun 2019 09:35:19 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5N7ZI7Z015732
 for <cocci@systeme.lip6.fr>; Sun, 23 Jun 2019 09:35:18 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,407,1557180000"; d="scan'208";a="311103180"
Received: from abo-12-105-68.mrs.modulonet.fr (HELO hadrien) ([85.68.105.12])
 by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Jun 2019 09:35:18 +0200
Date: Sun, 23 Jun 2019 09:35:17 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Kirill Smelkov <kirr@nexedi.com>
In-Reply-To: <20190623072838.31234-1-kirr@nexedi.com>
Message-ID: <alpine.DEB.2.21.1906230934080.4961@hadrien>
References: <20190623072838.31234-1-kirr@nexedi.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 23 Jun 2019 09:35:21 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Sun, 23 Jun 2019 09:35:18 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        linux-kernel@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>,
        Logan Gunthorpe <logang@deltatee.com>, cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH 1/2] coccinelle: api/stream_open: treat all
 wait_.*() calls as blocking
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



On Sun, 23 Jun 2019, Kirill Smelkov wrote:

> Previously steam_open.cocci was treating only wait_event_.* - e.g.
> wait_event_interruptible - as a blocking operation. However e.g.
> wait_for_completion_interruptible is also blocking, and so from this
> point of view it would be more logical to treat all wait_.* as a
> blocking point.
>
> The logic of this change actually came up for real when
> drivers/pci/switch/switchtec.c changed from using
> wait_event_interruptible to wait_for_completion_interruptible:
>
> 	https://lore.kernel.org/linux-pci/20190413170056.GA11293@deco.navytux.spb.ru/
> 	https://lore.kernel.org/linux-pci/20190415145456.GA15280@deco.navytux.spb.ru/
> 	https://lore.kernel.org/linux-pci/20190415154102.GB17661@deco.navytux.spb.ru/
>
> For a driver that uses nonseekable_open with read/write having stream
> semantic and read also calling e.g. wait_for_completion_interruptible,
> running stream_open.cocci before this patch would produce:
>
> 	WARNING: <driver>_fops: .read() and .write() have stream semantic; safe to change nonseekable_open -> stream_open.
>
> while after this patch it will report:
>
> 	ERROR: <driver>_fops: .read() can deadlock .write(); change nonseekable_open -> stream_open to fix.

Are you really sure that every word that starts with wait_ in the Linux
kernel has the property you want?  How many of them are there?  Would it
be reasonable to put the names in the semantic patch explicitly?

julia

>
> Cc: Julia Lawall <Julia.Lawall@lip6.fr>
> Cc: Logan Gunthorpe <logang@deltatee.com>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: Bjorn Helgaas <helgaas@kernel.org>
> Signed-off-by: Kirill Smelkov <kirr@nexedi.com>
> ---
>  scripts/coccinelle/api/stream_open.cocci | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/coccinelle/api/stream_open.cocci b/scripts/coccinelle/api/stream_open.cocci
> index 350145da7669..12ce18fa6b74 100644
> --- a/scripts/coccinelle/api/stream_open.cocci
> +++ b/scripts/coccinelle/api/stream_open.cocci
> @@ -35,11 +35,11 @@ type loff_t;
>  // a function that blocks
>  @ blocks @
>  identifier block_f;
> -identifier wait_event =~ "^wait_event_.*";
> +identifier wait =~ "^wait_.*";
>  @@
>    block_f(...) {
>      ... when exists
> -    wait_event(...)
> +    wait(...)
>      ... when exists
>    }
>
> @@ -49,12 +49,12 @@ identifier wait_event =~ "^wait_event_.*";
>  // XXX currently reader_blocks supports only direct and 1-level indirect cases.
>  @ reader_blocks_direct @
>  identifier stream_reader.readstream;
> -identifier wait_event =~ "^wait_event_.*";
> +identifier wait =~ "^wait_.*";
>  @@
>    readstream(...)
>    {
>      ... when exists
> -    wait_event(...)
> +    wait(...)
>      ... when exists
>    }
>
> --
> 2.20.1
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
