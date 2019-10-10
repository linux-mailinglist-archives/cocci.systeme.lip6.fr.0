Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BA3D2A94
	for <lists+cocci@lfdr.de>; Thu, 10 Oct 2019 15:14:00 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9ADDhIE019831;
	Thu, 10 Oct 2019 15:13:43 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 4DB7277C0;
	Thu, 10 Oct 2019 15:13:43 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id C555177AD
 for <cocci@systeme.lip6.fr>; Thu, 10 Oct 2019 15:13:41 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x9ADDfF8003093
 for <cocci@systeme.lip6.fr>; Thu, 10 Oct 2019 15:13:41 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.67,280,1566856800"; d="scan'208";a="405613960"
Received: from wifi-eduroam-85-039.paris.inria.fr ([128.93.85.39])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Oct 2019 15:13:40 +0200
Date: Thu, 10 Oct 2019 15:13:40 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: julia@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <24130ec6-4a20-7be4-755f-a6dfffcb6c97@web.de>
Message-ID: <alpine.DEB.2.21.1910101509370.2305@hadrien>
References: <24130ec6-4a20-7be4-755f-a6dfffcb6c97@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-14414668-1570713220=:2305"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 10 Oct 2019 15:13:43 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Thu, 10 Oct 2019 15:13:41 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Software analysis with SmPL around unchecked function
 calls
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
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-14414668-1570713220=:2305
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Thu, 10 Oct 2019, Markus Elfring wrote:

> Hello,
>
> I would like to try another source code analysis approach out with
> the software combination “Coccinelle 1.0.8-00004-g842075f7”.
>
> @display@
> expression x;
> statement is, es;
> @@
> (
> *x = kmemdup(...);
> |if (...)
> *x = kmemdup(...);
> )
> (if (!x) is
> |if (...) is else es
> |
>  ... when any
>      when != x
> )


It's not clear what you want to match.  The above rule matches all kmemdup
calls that are followed by the the indicated code.  Do you want the
following?

Why not just

x = kmemdup(...);
... when != x

julia

>
>
> This SmPL small script can point an update candidate out like
> the function “imx_pd_bind” as expected.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/imx/parallel-display.c?id=43b815c6a8e7dbccb5b8bd9c4b099c24bc22d135#n197
> https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/gpu/drm/imx/parallel-display.c#L197
>
> Unfortunately, I find also some false positives then at other places.
>
> Example:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/cpufreq/sfi-cpufreq.c?id=8a8c600de5dc1d9a7f4b83269fddc80ebd3dd045#n23
> https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/cpufreq/sfi-cpufreq.c#L23
>
> …
> @@ -37,7 +37,6 @@ static int sfi_parse_freq(struct sfi_tab
>  	pentry = (struct sfi_freq_table_entry *)sb->pentry;
>  	totallen = num_freq_table_entries * sizeof(*pentry);
>
> -	sfi_cpufreq_array = kmemdup(pentry, totallen, GFP_KERNEL);
>  	if (!sfi_cpufreq_array)
>  		return -ENOMEM;
> …
>
>
> Would you like to clarify this situation for the semantic patch language?
>
> Regards,
> Markus
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
--8323329-14414668-1570713220=:2305
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-14414668-1570713220=:2305--
