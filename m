Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC703D1F39
	for <lists+cocci@lfdr.de>; Thu, 22 Jul 2021 09:44:42 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 16M7iDUN012712;
	Thu, 22 Jul 2021 09:44:13 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id E8D6A77F8;
	Thu, 22 Jul 2021 09:44:12 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 91AF23FE7
 for <cocci@systeme.lip6.fr>; Thu, 22 Jul 2021 09:44:10 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 16M7i9S5027249
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Thu, 22 Jul 2021 09:44:09 +0200 (CEST)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A6W/bw6999i4+0Shw769uk+DBI+orL9Y04lQ7?=
 =?us-ascii?q?vn2ZOiYlEfBw9vrPoB1173DJYVoqM03I+urgBEDjex/hHPdOiOEs1NyZNjUO1l?=
 =?us-ascii?q?HEEGgv1+Xf/wE=3D?=
X-IronPort-AV: E=Sophos;i="5.84,260,1620684000"; d="scan'208";a="388685008"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 09:44:09 +0200
Date: Thu, 22 Jul 2021 09:44:08 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Michael Stefaniuc <mstefani@mykolab.com>
In-Reply-To: <f2dcf263-6c6b-9bd5-7f60-2baeb64947b4@mykolab.com>
Message-ID: <alpine.DEB.2.22.394.2107220943100.3118@hadrien>
References: <f2dcf263-6c6b-9bd5-7f60-2baeb64947b4@mykolab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 22 Jul 2021 09:44:15 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 22 Jul 2021 09:44:09 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Regression finding standard.iso
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



On Wed, 21 Jul 2021, Michael Stefaniuc wrote:

> Hello,
>
> to configure coccinelle I'm using:
> ./configure --prefix=/usr/local/packages/coccinelle-`git describe`
> After make install I just link the binaries to /usr/bin/.
>
> Now I'm getting following warning when running spatch:
> warning: Can't find default iso file:
> /usr/local/packages/coccinelle-1.1.0-50-g9e111ad5/bin/lib/coccinelle/standard.iso
>
> standard.iso is searched now under $prefix/bin/lib instead of the correct
> $prefix/lib.
>
> Reverting this commit fixes the issue for me:

Thanks for the report.  Maybe Thierry can find a better way to address the
issue.

julia

>
> commit 5016596228804588c96f0059818dd937e636d7ab
> Author: Thierry Martinez <Thierry.Martinez@inria.fr>
> Date:   Tue May 25 14:26:18 2021 +0200
>
>     Fix GH#259: Use @libdir@ for path, substituting ${exec_prefix}
>
>     Substitution is performed in OCaml since it enables tool relocation.
>     Looking for "${exec_dir}/standard.iso" first is kept since it is the
>     expected behavior for running the tool without installing it.
>
>
>
> bye
> 	michael
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
