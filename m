Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F12B9EE16C
	for <lists+cocci@lfdr.de>; Mon,  4 Nov 2019 14:38:49 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xA4DbxKb026960;
	Mon, 4 Nov 2019 14:37:59 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 610B477CE;
	Mon,  4 Nov 2019 14:37:59 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id C20C3454C
 for <cocci@systeme.lip6.fr>; Mon,  4 Nov 2019 14:37:57 +0100 (CET)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id xA4DbvrU006709
 for <cocci@systeme.lip6.fr>; Mon, 4 Nov 2019 14:37:57 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.68,267,1569276000"; d="scan'208";a="410191656"
Received: from portablejulia.rsr.lip6.fr ([132.227.76.63])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Nov 2019 14:37:56 +0100
Date: Mon, 4 Nov 2019 14:37:56 +0100 (CET)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: julia@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <1ee2e380-5e38-e2fe-7e4a-ba2ce01f72eb@web.de>
Message-ID: <alpine.DEB.2.21.1911041437360.2870@hadrien>
References: <1ee2e380-5e38-e2fe-7e4a-ba2ce01f72eb@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 04 Nov 2019 14:37:59 +0100 (CET)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Mon, 04 Nov 2019 14:37:57 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Coccinelle: zalloc-simple: Checking data processing for
 a bigger SmPL disjunction
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



On Mon, 4 Nov 2019, Markus Elfring wrote:

> Hello,
>
> I have tried the following small script variant out for
> the semantic patch language.
>
> @adjustment@
> type T, T2;
> expression x,E1,E2,E3,E4;
> statement S;
> @@
> (
> - x = kmalloc(E1,E2);
> + x = kzalloc(E1,E2);
> |
>  x = (T)dma_alloc_coherent(E2,E1,E3,E4);
> )
>   if ((x==NULL) || ...) S
> - memset((T2)x,0,E1);
>
>
> It can generate an usable diff hunk.
>
> elfring@Sonne:~/Projekte/Linux/next-patched> spatch scripts/coccinelle/api/alloc/zalloc-simple-x.cocci drivers/scsi/pmcraid.c
>
>
> But I would like to add the last case distinction also to a similar
> disjunction in the known (and discussed) SmPL script version.

What is "the known (and discussed) SmPL script version"?

> I observe that the expected diff hunk is not provided then.
> How would you like to fix this software situation?
>
> Regards,
> Markus
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
