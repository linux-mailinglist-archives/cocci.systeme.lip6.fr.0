Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A867425AB2E
	for <lists+cocci@lfdr.de>; Wed,  2 Sep 2020 14:32:49 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 082CWWM7028764;
	Wed, 2 Sep 2020 14:32:32 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 9F47277BC;
	Wed,  2 Sep 2020 14:32:32 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 6B2343F6C
 for <cocci@systeme.lip6.fr>; Wed,  2 Sep 2020 14:32:31 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 082CWUbq020075
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Wed, 2 Sep 2020 14:32:31 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,359,1592863200"; d="scan'208";a="357896954"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 14:32:30 +0200
Date: Wed, 2 Sep 2020 14:32:30 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Denis Efremov <efremov@linux.com>
In-Reply-To: <218db681-5a0f-020d-874c-457044f628e9@linux.com>
Message-ID: <alpine.DEB.2.22.394.2009021431350.2528@hadrien>
References: <218db681-5a0f-020d-874c-457044f628e9@linux.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 02 Sep 2020 14:32:32 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 02 Sep 2020 14:32:31 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] expression without side effects
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



On Wed, 2 Sep 2020, Denis Efremov wrote:

> Hi,
>
> I'm trying to write a pattern to match expression without side-effects,
> i.e expression E but not i++, --i, function call.
>
> While trying to write it I faced that this expression matches different
> array indices. Actually, it's quite unexpected for me:
>
> @@
> expression E;
> identifier A;
> @@
>
> * E->A || E->A

There is an isomorphism that you can disable: ptr_to_array

julia

>
> Actually, I would expect it not to match the file at all:
>
> $ spatch --cocci-file ./test.cocci ./drivers/md/dm-clone-metadata.c
> init_defs_builtins: /usr/lib64/coccinelle/standard.h
> HANDLING: ./drivers/md/dm-clone-metadata.c
> diff =
> --- ./drivers/md/dm-clone-metadata.c
> +++ /tmp/cocci-output-11041-66b4fb-dm-clone-metadata.c
> @@ -947,7 +947,6 @@ bool dm_clone_changed_this_transaction(s
> unsigned long flags;
>
> spin_lock_irqsave(&cmd->bitmap_lock, flags);
> -       r = cmd->dmap[0].changed || cmd->dmap[1].changed;
> spin_unlock_irqrestore(&cmd->bitmap_lock, flags);
>
> return r;
>
> Thanks,
> Denis
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
