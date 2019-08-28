Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C4AA0140
	for <lists+cocci@lfdr.de>; Wed, 28 Aug 2019 14:06:29 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x7SC6Cv7000683;
	Wed, 28 Aug 2019 14:06:12 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 2917677A1;
	Wed, 28 Aug 2019 14:06:12 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id DD7F974B3
 for <cocci@systeme.lip6.fr>; Wed, 28 Aug 2019 14:06:09 +0200 (CEST)
Received: from smtprelay.hostedemail.com (smtprelay0232.hostedemail.com
 [216.40.44.232])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x7SC68Vr017377
 for <cocci@systeme.lip6.fr>; Wed, 28 Aug 2019 14:06:09 +0200 (CEST)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave06.hostedemail.com (Postfix) with ESMTP id EB40B80231DC
 for <cocci@systeme.lip6.fr>; Wed, 28 Aug 2019 11:59:34 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id D6B92182CF66A;
 Wed, 28 Aug 2019 11:59:31 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, :::::::::::::::,
 RULES_HIT:41:355:379:599:800:960:967:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:1963:2194:2199:2393:2525:2553:2559:2564:2682:2685:2689:2828:2859:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3870:3871:3872:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:5007:6691:7903:7904:8985:9025:10004:10400:10848:11232:11473:11658:11914:12043:12297:12438:12555:12663:12740:12760:12895:13069:13311:13357:13439:14096:14097:14181:14659:14721:21080:21347:21451:21611:21627:30054:30070:30090:30091,
 0,
 RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.14.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:29,
 LUA_SUMMARY:none
X-HE-Tag: bells05_52ff9a104e953
X-Filterd-Recvd-Size: 2554
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
 (Authenticated sender: joe@perches.com)
 by omf09.hostedemail.com (Postfix) with ESMTPA;
 Wed, 28 Aug 2019 11:59:30 +0000 (UTC)
Message-ID: <84c7410d1d3ef56370c698c4e603e5422e337abc.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Julia Lawall
 <julia.lawall@lip6.fr>,
        Denis Efremov <efremov@linux.com>
Date: Wed, 28 Aug 2019 04:59:29 -0700
In-Reply-To: <95c32d19-eb4d-a214-6332-038610ec3dbd@rasmusvillemoes.dk>
References: <20190825130536.14683-1-efremov@linux.com>
 <b5bae2981e27d133b61d99b08ee60244bf7aabe3.camel@perches.com>
 <88f6e48e-1230-9488-a973-397f4e6dfbb5@linux.com>
 <4E9DDF9E-C883-44F0-A3F4-CD49284DB60D@lip6.fr>
 <95c32d19-eb4d-a214-6332-038610ec3dbd@rasmusvillemoes.dk>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 28 Aug 2019 14:06:12 +0200 (CEST)
X-Greylist: Delayed for 67:10:02 by milter-greylist-4.4.3 (isis.lip6.fr
 [132.227.60.2]); Wed, 28 Aug 2019 14:06:09 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Michal Marek <michal.lkml@markovi.net>,
        Nicolas Palix <nicolas.palix@imag.fr>, cocci@systeme.lip6.fr,
        linux-kernel@vger.kernel.org
Subject: Re: [Cocci] [PATCH] scripts: coccinelle: check for !(un)?likely
	usage
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

On Wed, 2019-08-28 at 13:33 +0200, Rasmus Villemoes wrote:
> On 25/08/2019 21.19, Julia Lawall wrote:
> > > On 26 Aug 2019, at 02:59, Denis Efremov <efremov@linux.com> wrote:
> > > > On 25.08.2019 19:37, Joe Perches wrote:
> > > > > On Sun, 2019-08-25 at 16:05 +0300, Denis Efremov wrote:
> > > > > This patch adds coccinelle script for detecting !likely and !unlikely
> > > > > usage. It's better to use unlikely instead of !likely and vice versa.
> > > > Please explain _why_ is it better in the changelog.
> > > In my naive understanding the negation (!) before the likely/unlikely
> > > could confuse the compiler
> > As a human I am confused. Is !likely(x) equivalent to x or !x?
> 
> #undef likely
> #undef unlikely
> #define likely(x) (x)
> #define unlikely(x) (x)
> 
> should be a semantic no-op. So changing !likely(x) to unlikely(x) is
> completely wrong. If anything, !likely(x) can be transformed to
> unlikely(!x).

likely and unlikely use __builtin_expect

https://gcc.gnu.org/onlinedocs/gcc/Other-Builtins.html#index-_005f_005fbuiltin_005fexpect
https://stackoverflow.com/questions/7346929/what-is-the-advantage-of-gccs-builtin-expect-in-if-else-statements

It's probable that of the more than 20K uses of
likely and unlikely in the kernel, most have no
real performance effect.


_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
