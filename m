Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB3A293866
	for <lists+cocci@lfdr.de>; Tue, 20 Oct 2020 11:44:33 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 09K9iHi4000898;
	Tue, 20 Oct 2020 11:44:17 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 1680977BF;
	Tue, 20 Oct 2020 11:44:17 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 9E7B445D8
 for <cocci@systeme.lip6.fr>; Tue, 20 Oct 2020 11:44:15 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 09K9iFMJ016404
 for <cocci@systeme.lip6.fr>; Tue, 20 Oct 2020 11:44:15 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,396,1596492000"; d="scan'208";a="362273034"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Oct 2020 11:44:14 +0200
Date: Tue, 20 Oct 2020 11:44:14 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Peng Liang <liangpeng10@huawei.com>
In-Reply-To: <ab7c6405-6384-9454-1219-08666b51c5c7@huawei.com>
Message-ID: <alpine.DEB.2.22.394.2010201143330.2736@hadrien>
References: <ab7c6405-6384-9454-1219-08666b51c5c7@huawei.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 20 Oct 2020 11:44:17 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 20 Oct 2020 11:44:15 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr, xiexiangyou 00584000 <xiexiangyou@huawei.com>
Subject: Re: [Cocci] spatch issue with compound literals
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



On Tue, 20 Oct 2020, Peng Liang wrote:

> Hi,
> I tried to use coccinelle to add an empty element to compound literals
> using spatch version 1.0.8 compiled with OCaml version 4.10.0.
>
> Here is my script:
> @@
> identifier a;
> identifier fld;
> expression E;
> @@
>  struct A a = {
>      ...,
>      .fld = (struct B[]) {
>          ...,
>          { ..., E, ... },
> +        {  }
>      },
>      ...,
>  };
>
> And I received the following error:
> minus: parse error:
>   File "add-end-of-list.cocci", line 8, column 21, charpos = 97
>   around = '[',
>   whole content =      .fld = (struct B[]) {
>
> Am I missing something?

I don't think it is supported.  Even if I put [...] instead of [], it just
complains about something else (the {).  I will see if it is possible to
fix.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
