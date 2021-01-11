Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A95762F20AA
	for <lists+cocci@lfdr.de>; Mon, 11 Jan 2021 21:24:43 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10BKNjx5022770;
	Mon, 11 Jan 2021 21:23:45 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 0692C77D9;
	Mon, 11 Jan 2021 21:23:45 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 10ECB74B6
 for <cocci@systeme.lip6.fr>; Mon, 11 Jan 2021 21:23:43 +0100 (CET)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10BKNdq3021834
 for <cocci@systeme.lip6.fr>; Mon, 11 Jan 2021 21:23:39 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,339,1602540000"; d="scan'208";a="486525003"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 21:23:39 +0100
Date: Mon, 11 Jan 2021 21:23:39 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Denis Efremov <efremov@linux.com>
In-Reply-To: <854fdad7-cf2d-49d8-571c-1ac64fa90fb6@linux.com>
Message-ID: <alpine.DEB.2.22.394.2101112122350.15982@hadrien>
References: <854fdad7-cf2d-49d8-571c-1ac64fa90fb6@linux.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 11 Jan 2021 21:23:45 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 11 Jan 2021 21:23:39 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] How to match function-like macro calls,
 e.g. RTA_ALIGN(rta->rta_len)?
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



On Mon, 11 Jan 2021, Denis Efremov wrote:

> Hi,
>
> Let's suppose I want to match otx_cpt_aead_cbc_aes_sha_setkey() function from
> drivers/crypto/marvell/octeontx/otx_cptvf_algs.c file (linux kernel).
>
> My pattern:
> @exists@
> identifier rta, param, key, keylen;
> position p;
> @@
>
> otx_cpt_aead_cbc_aes_sha_setkey(...,
> 	unsigned char *key, unsigned int keylen)
> {
> 	...
> *	if (RTA_PAYLOAD(rta) < sizeof(*param))@p
> 		goto badkey;
> 	...
> *	key += RTA_ALIGN(rta->rta_len);
> *	keylen -= RTA_ALIGN(rta->rta_len);
> 	...
> }
>
> $ spatch --no-includes --include-headers --cocci-file test.cocci drivers/crypto/marvell/octeontx/otx_cptvf_algs.c
> init_defs_builtins: /usr/lib64/coccinelle/standard.h
> minus: parse error:
>   File "test.cocci", line 13, column 9, charpos = 219
>   around = 'RTA_ALIGN',
>   whole content = *     key += RTA_ALIGN(rta->rta_len);
>
>
> What can I do to match RTA_ALIGN(...) lines?

I don't understand the problem.  I took your rule and your command line,
and everything was fine.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
