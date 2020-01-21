Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D30414371B
	for <lists+cocci@lfdr.de>; Tue, 21 Jan 2020 07:30:28 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 00L6U94o004906;
	Tue, 21 Jan 2020 07:30:09 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id C841077F2;
	Tue, 21 Jan 2020 07:30:09 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 945D677DB
 for <cocci@systeme.lip6.fr>; Tue, 21 Jan 2020 07:30:08 +0100 (CET)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 00L6U4J3005084
 for <cocci@systeme.lip6.fr>; Tue, 21 Jan 2020 07:30:04 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,344,1574118000"; d="scan'208";a="432302784"
Received: from unknown (HELO hadrien) ([167.98.102.107])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jan 2020 07:30:03 +0100
Date: Tue, 21 Jan 2020 06:30:03 +0000 (GMT)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <7fc95d036dbda26e6540839ef25c5c09c21ca747.camel@gmail.com>
Message-ID: <alpine.DEB.2.21.2001210629190.2301@hadrien>
References: <20200119134812.32748-1-jaskaransingh7654321@gmail.com>
 <alpine.DEB.2.21.2001210619100.2301@hadrien>
 <7fc95d036dbda26e6540839ef25c5c09c21ca747.camel@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 21 Jan 2020 07:30:10 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 21 Jan 2020 07:30:04 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
        "cocci@systeme.lip6.fr" <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] [PATCH] parsing_hacks: Add bool to list of known
	typedefs
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



On Tue, 21 Jan 2020, Jaskaran Singh wrote:

> On Tue, 2020-01-21 at 06:20 +0000, Julia Lawall wrote:
> >
> > On Sun, 19 Jan 2020, Jaskaran Singh wrote:
> >
> > > bool is widely used in the Linux kernel. Certain cases of
> > > parsing_hacks.ml would mislabel bool.
> > >
> > > Add bool to the list of known typedefs.
> > >
> > > Stats of --parse-c on Linux v5.5-rc4 are as follows:
> > >
> > > Before:
> > >
> > >   nb good = 18956150,  nb passed = 134062 =========> 0.70% passed
> > >
> > > After:
> > >
> > >   nb good = 18956150,  nb passed = 134073 =========> 0.70% passed
> >
> > Why did nb passed increase?  These are tokens that will not be able
> > to be
> > transformed by a semantic patch.
> >
>
> I suspect it's instances of nokprobe_inline in
> linux/kernel/trace/trace_kprobe.c. They're marked as CppMacro.

OK, that looks ok.  Could you update the log messages with that
information?

thanks,
julia


>
> Here's results from my diff:
>
> 20402,20406c20288,20294
> < passed:bool
> < passed:bool
> < passed:bool
> < passed:bool
> < passed:bool
> ---
> > passed:nokprobe_inline
> > passed:nokprobe_inline
> > passed:nokprobe_inline
> > passed:nokprobe_inline
> > passed:nokprobe_inline
> > passed:nokprobe_inline
> > passed:nokprobe_inline
> 20407a20296,20297
> > passed:nokprobe_inline
> > passed:nokprobe_inline
> 20408a20299,20300
> > passed:nokprobe_inline
> > passed:nokprobe_inline
> 20409a20302,20303
> > passed:nokprobe_inline
> > passed:nokprobe_inline
> 20410a20305,20306
> > passed:nokprobe_inline
> > passed:nokprobe_inline
>
> Cheers,
> Jaskaran.
>
> > julia
> >
> > > Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
> > > ---
> > > The above diff has been obtained after applying
> > > https://www.mail-archive.com/cocci@systeme.lip6.fr/msg06706.html
> > >
> > >  parsing_c/parsing_hacks.ml | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/parsing_c/parsing_hacks.ml
> > > b/parsing_c/parsing_hacks.ml
> > > index 685a4908..5e3301a0 100644
> > > --- a/parsing_c/parsing_hacks.ml
> > > +++ b/parsing_c/parsing_hacks.ml
> > > @@ -61,7 +61,7 @@ let is_known_typdef =
> > >        | "u_char"   | "u_short"  | "u_int"  | "u_long"
> > >        | "u8" | "u16" | "u32" | "u64"
> > >        | "s8"  | "s16" | "s32" | "s64"
> > > -      | "__u8" | "__u16" | "__u32"  | "__u64"
> > > +      | "__u8" | "__u16" | "__u32"  | "__u64" | "bool"
> > >          -> true
> > >
> > >        | "acpi_handle"
> > > --
> > > 2.21.1
> > >
> > >
>
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
