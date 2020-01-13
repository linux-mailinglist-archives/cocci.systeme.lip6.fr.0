Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A55B4139CA1
	for <lists+cocci@lfdr.de>; Mon, 13 Jan 2020 23:34:08 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 00DMXrPw017603;
	Mon, 13 Jan 2020 23:33:53 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 1082177F5;
	Mon, 13 Jan 2020 23:33:53 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 5E7D6771F
 for <cocci@systeme.lip6.fr>; Mon, 13 Jan 2020 23:33:51 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 00DMXoOP001362
 for <cocci@systeme.lip6.fr>; Mon, 13 Jan 2020 23:33:50 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,430,1571695200"; d="scan'208";a="335683714"
Received: from abo-154-110-68.mrs.modulonet.fr (HELO hadrien) ([85.68.110.154])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2020 23:33:50 +0100
Date: Mon, 13 Jan 2020 23:33:50 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Timur Tabi <timur@kernel.org>
In-Reply-To: <CAOZdJXU4vhqzot5EEMZ_9jAdp-Be0TTyDS-uXJVPrGs2k=c7nA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2001132332060.2574@hadrien>
References: <CAOZdJXU4vhqzot5EEMZ_9jAdp-Be0TTyDS-uXJVPrGs2k=c7nA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 13 Jan 2020 23:33:53 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 13 Jan 2020 23:33:51 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Concatenating parameters into a string
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

On Mon, 13 Jan 2020, Timur Tabi wrote:

> I don't know how to properly describe what I'm trying to do, so I'll
> just show an example.
>
> The code I'm working on has dozens of annoying macros that concatenate
> parameters into strings.  For example,
>
> #define DRF_DEF(d,r,f,c)  \
>        (((NvU32)(NV ## d ## r ## f ## c))<<DRF_SHIFT(NV ## d ## r ## f))
>
> So given DRF_DEF(one, two, three, four), it will generated:
>
> (((NvU32)(NV_one_two_three_four))<<DRF_SHIFT(NV_one_two_three))
>
> I'm trying to create a cocci rule that will replace all of these
> macros with their expanded equivalents, but I don't know how to handle
> the ## feature of macros.  So far I have this:
>
> @@
> expression d, r, f, n, v;
> @@
> -FLD_SET_DRF_NUM(d, r, f, n, v)
> +((v) & ~DRF_SHIFTMASK(NV d r f)) | DRF_NUM(d, r, f, n)

Sorry, I don't follow what you are trying to do here.  Could you send an
example of the desired before after C code?  I see what you have above,
but I don't see the connection to the rule you have tried to write.

I have the feeling that you will want to use some python code to do
something with the ##s, but I'm not sure.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
